echo "YouTube Video/YouTube Channel"
echo.
set /P url="Enter URL: "
echo.
set "homePath=E:/Video"
echo.
set "videoPath="%(uploader)s""
echo.
set "videoNameScheme="(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s""
echo.
echo.
yt-dlp ^
    %url% ^
    -f "bv+ba/b" ^
    -P "%homePath%" ^
    -o "/%videoPath%/%videoNameScheme%" ^
    --download-archive "%homePath%/Archive.txt" ^
    --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:/%videoPath%/[Archive]/Info/%videoNameScheme%" ^
    --write-subs -o "subtitle:/%videoPath%/[Archive]/Subtitles/%videoNameScheme%" ^
    --write-link -o "link:/%videoPath%/[Archive]/Links/%videoNameScheme%" ^
    --write-description -o "description:/%videoPath%/[Archive]/Descriptions/%videoNameScheme%" ^
    --write-thumbnail -o "thumbnail:/%videoPath%/[Archive]/Thumbnails/%videoNameScheme%" ^
    -o "chapter:/%videoPath%/[Archive]/Chapters/%videoNameScheme%" ^
    -o "pl_description:/%videoPath%/[Archive]/Descriptions/Playlist Descriptions/%videoNameScheme%" ^
    -o "pl_thumbnail:/%videoPath%/[Archive]/Thumbnails/Playlist Thumbnails/%videoNameScheme%" ^
    -o "pl_infojson:/%videoPath%/[Archive]/Info/Playlist Info/%videoNameScheme%" ^
    --write-comments --extractor-args "youtube:comment_sort=top;max_comments=50,all,0,0" ^
    --remux-video "mp4/aac" ^
    --merge-output-format "mp4" ^
    --downloader aria2c ^
    --sponsorblock-mark all 
pause