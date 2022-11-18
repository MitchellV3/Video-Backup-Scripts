
echo.
set "homePath=E:/Video/"
echo.
set "vodPath=%(uploader)s/Past Broadcasts/%(upload_date>%Y-%m)s"
echo.
set "vodNameScheme=(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s"
echo.
set "chatDownloader="%~dp0TWITCHCHAT.bat""
echo.
set "chatNameScheme=(%(upload_date>%Y/%m/%d)s)-%(title)s-[%(id)s].%(ext)s"
echo.
set /P url="Enter URL: "
echo.
for %%a in ("%url%") do (
   set urlNoLeadingInfo=%url:*/=%
   set urlIdOnly=%urlNoLeadingInfo:*/=%
)
echo %urlIdOnly%
echo.
yt-dlp ^
%url%  ^
    -f "bv+ba/b" ^
    -P "%homePath%" ^
    -o "%vodPath%/%vodNameScheme%" ^
    --download-archive "%homepath%Archive.txt" ^
    --embed-thumbnail ^
    --embed-metadata ^
    --embed-chapters ^
    --embed-info-json ^
    --write-info-json -o ^
        "infojson:%vodPath%/[Archive]/Info/%vodNameScheme%" ^
    --write-link -o ^
        "link:%vodPath%/[Archive]/Links/%vodNameScheme%" ^
    --write-description -o ^
        "description:%vodPath%/[Archive]/Descriptions/%vodNameScheme%" ^
    --write-thumbnail -o ^
        "thumbnail:%vodPath%/[Archive]/Thumbnails/%vodNameScheme%" ^
    --merge-output-format "mp4" ^
    --downloader "aria2c" ^
    --exec ^
        "after_video:%chatDownloader% "%homepath%/%vodPath%//[Archive]/Chat/(%(upload_date>%Y/%m/%d)s) HALLOWEEN DAY 🎃🎃🎃 15 SIGNALIS (Part 1-3) [%(id)s]"" 
pause