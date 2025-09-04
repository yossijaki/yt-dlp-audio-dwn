# YT Music Dwnldr (Windows Batch Script)

This project allows you to dwnld music from YT in **MP3 format** with the video's thumbnail embedded as album art. It uses **yt-dlp** and **FFmpeg** for dwnldng and processing. Designed for Windows, it is simple and ready to use.

---

## 📂 Project Structure

```
yt-dlp-audio-dwn/
│
├── downloads-list.txt      # List of URLs to dwnld (placed in the root)
├── download.bat            # Main script to start dwnld
│
├── res/
│   ├── yt-dlp.exe          # yt-dlp executable
│   └── ffmpeg.exe          # FFmpeg executable
│
├── temp-files/             # Temporary folder (auto-created)
└── downloads/              # Output folder for downloaded files (auto-created)

```

- `res/yt-dlp.exe` → yt-dlp executable
- `res/ffmpeg.exe` → FFmpeg executable
- `downloads-list.txt` → text file containing YT links
- `download.bat` → main batch script for downloads

---

## 📝 How to Use

1. Open `downloads-list.txt` with **Notepad** or any text editor.  
2. Add YT links, **one per line**, for example (put the complete YT word in the real links):

	[https://www.yt.com/watch?v=abc123](https://www.yt.com/watch?v=abc123)  
	[https://www.yt.com/watch?v=def456](https://www.yt.com/watch?v=def456)  
	[https://www.yt.com/watch?v=ghi789](https://www.yt.com/watch?v=ghi789)  


> ⚠️ Each link must be on a separate line. Do not add commas or trailing spaces.

3. Save the file and close the editor.  

4. **Double-click** `downloads.bat`.  
   - The script will dwnld:
     - The audio in **MP3** with best available quality.
     - The video thumbnail cropped as a square.
     - Embed the thumbnail into the MP3 file.
     - Save the final file in the `downloads/` folder using the **YT video title** as the filename.

5. Temporary files will be automatically deleted from `temp-files/` after each dwnld.

---

## ✅ Features

- Dwnlds the audio in mp3's best quality available
- Embeds the YT video thumbnail as the cover in cropped format
- Works on **Windows 10 and 11**.
- No additional installation required, just make sure `yt-dlp.exe` and `ffmpeg.exe` are in `res/`.
- Supports multiple links from `downloads-list.txt`.

---

## ⚠️ Important Notes

- Avoid videos with **age or regional restrictions**, as they may fail to dwnld.
- Do not move or rename `yt-dlp.exe` or `ffmpeg.exe`; they must stay in the `res/` folder.
- If a dwnld fails, check your **internet connection** and that the link is valid (click in the "Share" button below the video to copy the link without any additional playlist added).
