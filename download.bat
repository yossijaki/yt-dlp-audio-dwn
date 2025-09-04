@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Ruta base (donde está este .bat)
set "BASEDIR=%~dp0"

:: Variables para yt-dlp y ffmpeg dentro de la carpeta res
set "YTDLP=%BASEDIR%res\yt-dlp.exe"
set "FFMPEG=%BASEDIR%res\ffmpeg.exe"

:: Crear carpetas si no existen
if not exist "%BASEDIR%temp-files" mkdir "%BASEDIR%temp-files"
if not exist "%BASEDIR%downloads" mkdir "%BASEDIR%downloads"

:: Recorre cada línea del archivo multiple-links.txt
for /f "usebackq delims=" %%L in ("%BASEDIR%downloads-list.txt") do (
    set "URL=%%L"
    echo Procesando: !URL!
    for /f "delims=" %%A in ('%YTDLP% --get-title "!URL!"') do (
        set "title=%%A"
        call :process
    )
)
exit /b

:process
rem Descargar miniatura
"%YTDLP%" --write-thumbnail --skip-download -o "%BASEDIR%temp-files/thumb_raw.%%(ext)s" "!URL!"
if errorlevel 1 echo ERROR: yt-dlp no pudo descargar la miniatura && exit /b

rem Convertir miniatura a 720x720
"%FFMPEG%" -i "%BASEDIR%temp-files/thumb_raw.webp" -vf "crop='if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)',scale=720:720" -frames:v 1 -update 1 -c:v mjpeg "%BASEDIR%temp-files/thumb_square.jpg"
if errorlevel 1 echo ERROR: ffmpeg no pudo procesar la miniatura && exit /b

rem Descargar audio y extraer metadata
"%YTDLP%" -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --add-metadata --metadata-from-title "%%(artist)s - %%(title)s" -o "%BASEDIR%temp-files/audio_raw.%%(ext)s" "!URL!"
if errorlevel 1 echo ERROR: yt-dlp no pudo descargar el audio && exit /b

rem Combinar audio y portada
"%FFMPEG%" -i "%BASEDIR%temp-files/audio_raw.mp3" -i "%BASEDIR%temp-files/thumb_square.jpg" -map 0 -map 1 -c copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "%BASEDIR%downloads/!title!.mp3"
if errorlevel 1 echo ERROR: ffmpeg no pudo combinar portada con audio && exit /b

rem Limpiar temp-files
del /q "%BASEDIR%temp-files\*.*" 2>nul
exit /b
