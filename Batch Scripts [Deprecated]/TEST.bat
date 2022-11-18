echo off
set "chatdownloader=%cd%\TWITCHCHAT.bat"
set "chatdownloader2="%cd%\TWITCHCHAT.bat""
set chatdownloader3="%cd%\TWITCHCHAT.bat"
set chatdownloader4="%cd%\TWITCHCHAT.bat"
echo.
echo "%chatdownloader%"
echo.
echo %chatdownloader2%
echo.
echo %chatdownloader3%
echo.
echo %chatdownloader3%
echo.
echo %*
echo %*
echo %1
pause 



yt-dlp ^
    -f "bv+ba/b" ^
    -P "E:/Video/" ^
    -o "%(uploader)s/%(playlist)s/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --download-archive "E:/Video/Archive.txt" ^
    --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:%(uploader)s/%(playlist)s/[Archive]/Info/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-subs -o "subtitle:%(uploader)s/%(playlist)s/[Archive]/Subtitles/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s (%(upload_date>%Y/%m/%d)s) [%(id)s].%(ext)s" ^
    --write-link -o "link:%(uploader)s/%(playlist)s/[Archive]/Links/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s (%(upload_date>%Y/%m/%d)s) [%(id)s].%(ext)s" ^
    --write-description -o "description:%(uploader)s/%(playlist)s/[Archive]/Descriptions/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-thumbnail -o "thumbnail:%(uploader)s/%(playlist)s/[Archive]/Thumbnails/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "chapter:%(uploader)s/%(playlist)s/[Archive]/Chapters/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_description:%(uploader)s/%(playlist)s/[Archive]/Descriptions/Playlist Descriptions/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_thumbnail:%(uploader)s/%(playlist)s/[Archive]/Thumbnails/Playlist Thumbnails/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_infojson:%(uploader)s/%(playlist)s/[Archive]/Info/Playlist Info/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-comments --extractor-args "youtube:comment_sort=top;max_comments=50,all,0,0" ^
    --remux-video "mp4/aac" --merge-output-format "mp4" ^
    --downloader aria2c ^
    --sponsorblock-mark all ^
