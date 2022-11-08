# Video-Backup-Scripts

## YouTube Video/YouTube Channel [--no-warnings, --downloader aria2c, --concurrent-fragments "5"]

yt-dlp ^
    -f "bv+ba/b" ^
    -P "E:/Video/" ^
    -o "%(uploader)s/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --download-archive "E:/Video/Archive.txt" ^
    --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:%(uploader)s/[Archive]/Info/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-subs -o "subtitle:%(uploader)s/[Archive]/Subtitles/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-link -o "link:%(uploader)s/[Archive]/Links/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-description -o "description:%(uploader)s/[Archive]/Descriptions/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-thumbnail -o "thumbnail:%(uploader)s/[Archive]/Thumbnails/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "chapter:%(uploader)s/[Archive]/Chapters/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_description:(uploader)s/[Archive]/Descriptions/Playlist Descriptions/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_thumbnail:(uploader)s/[Archive]/Thumbnails/Playlist Thumbnails/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_infojson:(uploader)s/[Archive]/Info/Playlist Info/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-comments --extractor-args "youtube:comment_sort=top;max_comments=50,all,0,0" ^
    --remux-video "mp4/aac" --merge-output-format "mp4" ^
    --downloader aria2c ^
    --sponsorblock-mark all ^
https://www.youtube.com/channel/UCuSmfyt4Z7KNdbqLO7uPMBA/videos

## YouTube Playlist - Multiple Channels (ie. "Favorites" Playlist) [--no-warnings]

yt-dlp ^
    -f "bv+ba/b" ^
    -P "E:/Video/" ^
    -o "[Playlists]/%(playlist)s/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --download-archive "E:/Video/Archive.txt" ^
    --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:[Playlists]/%(playlist)s/[Archive]/Info/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-subs -o "subtitle:[Playlists]/%(playlist)s/[Archive]/Subtitles/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s (%(upload_date>%Y/%m/%d)s) [%(id)s].%(ext)s" ^
    --write-link -o "link:[Playlists]/%(playlist)s/[Archive]/Links/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s (%(upload_date>%Y/%m/%d)s) [%(id)s].%(ext)s" ^
    --write-description -o "description:[Playlists]/%(playlist)s/[Archive]/Descriptions/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-thumbnail -o "thumbnail:[Playlists]/%(playlist)s/[Archive]/Thumbnails/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "chapter:[Playlists]/%(playlist)s/[Archive]/Chapters/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_description:[Playlists]/%(playlist)s/[Archive]/Descriptions/Playlist Descriptions/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_thumbnail:[Playlists]/%(playlist)s/[Archive]/Thumbnails/Playlist Thumbnails/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    -o "pl_infojson:[Playlists]/%(playlist)s/[Archive]/Info/Playlist Info/%(playlist_index)s - (%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-comments --extractor-args "youtube:comment_sort=top;max_comments=50,all,0,0" ^
    --playlist-reverse ^
    --remux-video "mp4/aac" --merge-output-format "mp4" ^
    --downloader aria2c ^
    --sponsorblock-mark all ^
https://www.youtube.com/channel/UCuSmfyt4Z7KNdbqLO7uPMBA/videos

## YouTube Playlist - One Channel [--no-warnings]

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
https://www.youtube.com/playlist?list=PLsMtUWKCmBPRFzqglpk4YQlNFy8wzSXBN

## YouTube Livestream VOD/Live [--no-warnings]

yt-dlp ^
    -f "bv+ba/b" ^
    -P "E:/Video/" ^
    -o "%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --download-archive "E:/Video/Archive.txt" ^
    --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Info/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-link -o "link:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Links/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-description -o "description:%(uploader)s/[Archive]/Descriptions/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-thumbnail -o "thumbnail:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Thumbnails/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --remux-video "mp4/aac" --merge-output-format "mp4" ^
    --downloader aria2c ^
    --live-from-start ^
https://www.youtube.com/playlist?list=PLsMtUWKCmBPRFzqglpk4YQlNFy8wzSXBN

## Twitch VOD With Chat Json and Chat Render [--no-warnings, --restrict-filenames, --skip-download]

yt-dlp ^
    -f "bv+ba/b" ^
    -P "E:/Video/" ^
    -o "%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --download-archive "E:/Video/Archive.txt" ^
    --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json ^
    --write-info-json -o "infojson:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Info/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-link -o "link:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Links/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-description -o "description:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Descriptions/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --write-thumbnail -o "thumbnail:%(uploader)s/Past-Broadcasts/%(upload_date>%Y-%m)s/[Archive]/Thumbnails/(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s" ^
    --remux-video "mp4/aac" --merge-output-format "mp4" ^
    --downloader aria2c ^
    --exec ^
        "after_video:C:\twitch.bat E:\Video\%(uploader)s\Past-Broadcasts\%(upload_date>%Y-%m)s\[Archive]\Chat\(%(upload_date>%Y-%m-%d)s)%(uploader)s[%(id)s]" ^
https://www.twitch.tv/videos/1640219966

## TWITCH CHAT JSON

TwitchDownloaderCLI ^
    -m ChatDownload ^
    --embed-emotes ^
    --id "VODID" ^
    -o "JSONPATH" ^
    --threads 4

## TWITCH CHAT RENDER

TwitchDownloaderCLI ^
    -m ChatRender ^
    -i "JSONPATH" ^
    -h 1080 -w 422 ^
    --font-size 18 ^
    -o "RENDERPATH" ^
    --threads 4

## STACK VIDEOS WITH FFMPEG [CPU GOES SUPERNOVA - DON'T USE UNLESS CONFIDENT]

ffmpeg ^
    -threads 4 ^
    -i "INPUTPATH1" ^
    -i "INPUTPATH2" ^
    -c:v libx264 ^
    -preset veryfast ^
    -crf 18 ^
    -pix_fmt yuv420p ^
    -filter_complex "[0][1]hstack" ^
    -threads:v 4 ^
    "RENDERPATH"
