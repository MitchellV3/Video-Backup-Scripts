Write-Output "----------Twitch VOD----------"
Write-Output ""
Write-Output "***Download Type***"
Write-Output "1 - VOD + Chat Render (JSON + MP4)"
Write-Output "2 - VOD + Chat Archive (JSON)"
Write-Output "3 - VOD Only"
Write-Output "4 - Chat Render Only"
Write-Output "5 - Chat Archive Only"
Write-Output ""
$downloadType = Read-Host -Prompt "Select Download Type"

$url = Read-Host -Prompt "Enter URL"
$url = $url.Split("?")[0]
Write-Output $url

$homePath = "E:/Video/"
$archivePath = $homePath + "TwitchArchive.txt"
$videoPath = "%(uploader)s/Past Broadcasts/%(upload_date>%Y-%m)s"
$videoNameScheme = "(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s].%(ext)s"

$chatDownloader = $PSScriptRoot + "\TWITCHCHATFETCHER.ps1"
$JsonPath = $homePath + $videoPath + "/[Archive]/Chat"
$RenderPath = $homePath + $videoPath + "/[Chat]"
$chatJson = $JsonPath + "/(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s]" 
$chatRender = $RenderPath + "/(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s]" 


if ($downloadType -eq "1" -or $downloadType -eq "2") {
    yt-dlp `
        $url `
        -f "bv+ba/b" `
        -P "$homePath" `
        -o "$videoPath/$videoNameScheme" `
        --download-archive "$archivePath" `
        --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json `
        --replace-in-metadata "title" "\|", "-" `
        --replace-in-metadata "title" "'", ";" `
        --replace-in-metadata "title" ":", " -" `
        --replace-in-metadata "title" "\\", "-" `
        --replace-in-metadata "title" "\?", "." `
        --replace-in-metadata "title" "\/", "." `
        --write-info-json -o "infojson:$videoPath/[Archive]/Info/$videoNameScheme" `
        --write-link -o "link:$videoPath/[Archive]/Links/$videoNameScheme" `
        --write-description -o "description:$videoPath/[Archive]/Descriptions/$videoNameScheme" `
        --write-thumbnail -o "thumbnail:$videoPath/[Archive]/Thumbnails/$videoNameScheme" `
        --merge-output-format "mp4" `
        --downloader "aria2c" `
        --exec "after_video:powershell $chatDownloader '$chatJson' '$chatRender' $url '$JsonPath' '$RenderPath' $downloadType" 
} elseif ($downloadType -eq "3") {
    yt-dlp `
        $url `
        -f "bv+ba/b" `
        -P "$homePath" `
        -o "$videoPath/$videoNameScheme" `
        --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json `
        --replace-in-metadata "title" "\|", "-" `
        --replace-in-metadata "title" "'", ";" `
        --replace-in-metadata "title" ":", " -" `
        --replace-in-metadata "title" "\\", "-" `
        --replace-in-metadata "title" "\?", "." `
        --replace-in-metadata "title" "\/", "." `
        --write-info-json -o "infojson:$videoPath/[Archive]/Info/$videoNameScheme" `
        --write-link -o "link:$videoPath/[Archive]/Links/$videoNameScheme" `
        --write-description -o "description:$videoPath/[Archive]/Descriptions/$videoNameScheme" `
        --write-thumbnail -o "thumbnail:$videoPath/[Archive]/Thumbnails/$videoNameScheme" `
        --downloader "aria2c"
} elseif ($downloadType -eq "4" -or $downloadType -eq "5") {
    yt-dlp `
        $url `
        -f "bv+ba/b" `
        -P "$homePath" `
        -o "$videoPath/$videoNameScheme" `
        --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json `
        --replace-in-metadata "title" "\|", "-" `
        --replace-in-metadata "title" "'", ";" `
        --replace-in-metadata "title" ":", " -" `
        --replace-in-metadata "title" "\\", "-" `
        --replace-in-metadata "title" "\?", "." `
        --replace-in-metadata "title" "\/", "." `
        --write-info-json -o "infojson:$videoPath/[Archive]/Info/$videoNameScheme" `
        --write-link -o "link:$videoPath/[Archive]/Links/$videoNameScheme" `
        --write-description -o "description:$videoPath/[Archive]/Descriptions/$videoNameScheme" `
        --write-thumbnail -o "thumbnail:$videoPath/[Archive]/Thumbnails/$videoNameScheme" `
        --downloader "aria2c" `
        --skip-download `
        --exec "after_video:powershell $chatDownloader '$chatJson' '$chatRender' $url '$JsonPath' '$RenderPath' $downloadType" 
} else {
    Write-Output ""
    Write-Output "Invalid Download Type"
    Write-Output ""
    Write-Host -NoNewLine 'Press any key to exit...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

Write-Output ""
Write-Output "Process Complete"
Write-Output ""
Write-Host -NoNewLine 'Press any key to exit...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
exit

