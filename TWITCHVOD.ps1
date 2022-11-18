Write-Output "----------Twitch VOD----------"
$url = Read-Host -Prompt "Enter URL"
$url = $url.Split("?")[0]
Write-Output $url

$homePath = "E:/Video/"
$archivePath = $homePath + "TwitchArchive.txt"
$videoPath = "%(uploader)s/Past Broadcasts/%(upload_date>%Y-%m)s"
$videoNameScheme = "(%(upload_date>%Y/%m/%d)s) %(title)s [%(id)s].%(ext)s"

$chatDownloader = $PSScriptRoot + "\TWITCHCHAT.ps1"
$JsonPath = $homePath + $videoPath + "/[Archive]/Chat"
$RenderPath = $homePath + $videoPath + "/[Chat]"
$chatJson = $JsonPath + "/(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s]" 
$chatRender = $RenderPath + "/(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s]" 

yt-dlp `
    $url `
    -f "bv+ba/b" `
    -P "$homePath" `
    -o "$videoPath/$videoNameScheme" `
    --download-archive "$archivePath" `
    --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json `
    --replace-in-metadata "title" "\|", " " `
    --replace-in-metadata "title" "'", ";" `
    --write-info-json -o "infojson:$videoPath/[Archive]/Info/$videoNameScheme" `
    --write-link -o "link:$videoPath/[Archive]/Links/$videoNameScheme" `
    --write-description -o "description:$videoPath/[Archive]/Descriptions/$videoNameScheme" `
    --write-thumbnail -o "thumbnail:$videoPath/[Archive]/Thumbnails/$videoNameScheme" `
    --merge-output-format "mp4" `
    --downloader "aria2c" `
    --exec "after_video:powershell $chatDownloader '$chatJson' '$chatRender' $url '$JsonPath' '$RenderPath'" `

PowerShell -NoExit
