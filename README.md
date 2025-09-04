# YouTube Music Downloader (Windows Batch Script)

This project allows you to download music from YouTube in **MP3 format** with the video's thumbnail embedded as album art. It uses **yt-dlp** and **FFmpeg** for downloading and processing. Designed for Windows, it is simple and ready to use.

---

## 📂 Project Structure

```

/res
yt-dlp.exe
ffmpeg.exe
downloads-list.txt
downloads.bat
/temp-files   (temporary folder, auto-created)
downloads     (output folder, auto-created)

```

- `res/yt-dlp.exe` → yt-dlp executable
- `res/ffmpeg.exe` → FFmpeg executable
- `downloads-list.txt` → text file containing YouTube links
- `downloads.bat` → main batch script for downloads

---

## 📝 How to Use

1. Open `downloads-list.txt` with **Notepad** or any text editor.  
2. Add YouTube links, **one per line**, for example:

```

[https://www.youtube.com/watch?v=abc123](https://www.youtube.com/watch?v=abc123)
[https://www.youtube.com/watch?v=def456](https://www.youtube.com/watch?v=def456)
[https://www.youtube.com/watch?v=ghi789](https://www.youtube.com/watch?v=ghi789)

```

> ⚠️ Each link must be on a separate line. Do not add commas or trailing spaces.

3. Save the file and close the editor.  

4. **Double-click** `downloads.bat`.  
   - The script will download:
     - The audio in **MP3** with best available quality.
     - The video thumbnail cropped as a square.
     - Embed the thumbnail into the MP3 file.
     - Save the final file in the `downloads/` folder using the **YouTube video title** as the filename.

5. Temporary files will be automatically deleted from `temp-files/` after each download.

---

## ✅ Features

- Correctly handles **accented and special characters** in YouTube titles.
- Replaces invalid filename characters (`/ \ : * ? " < > |`) automatically.
- Works on **Windows 10 and 11**.
- No additional installation required, just place `yt-dlp.exe` and `ffmpeg.exe` in `res/`.
- Supports multiple links from `downloads-list.txt`.

---

## ⚠️ Important Notes

- Make sure the **.bat script is saved as UTF-8 with BOM** to avoid issues with special characters.
- Avoid videos with **age or regional restrictions**, as they may fail to download.
- Do not move or rename `yt-dlp.exe` or `ffmpeg.exe`; they must stay in the `res/` folder.
- If a download fails, check your **internet connection** and that the link is valid.
