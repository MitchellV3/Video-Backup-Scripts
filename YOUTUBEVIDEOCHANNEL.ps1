#TODO: 
#Ability to add a custom title
#Ability to make a custom folder
#Ability to read a file with a list of videos
Write-Output "----------YouTube Video/YouTube Channel----------"
Write-Output ""
Write-Output "***Organization Options***"
Write-Output "1 - Automatically Determine"
Write-Output "2 - Custom Channel Name"
Write-Output "3 - Custom Upload Date"
Write-Output "4 - Custom Channel Name and Upload Date"
Write-Output ""
$organizationOption = Read-Host -Prompt "Select Organization Option"

$videoPath = "%(uploader)s"
$videoNameScheme = "(%(upload_date>%Y-%m-%d)s) %(title)s [%(id)s].%(ext)s"

if ($organizationOption -eq "1") {
    Write-Output "Automatically Determining Information"
} elseif ($organizationOption -eq "2") {
    $videoPath = Read-Host -Prompt "Enter Channel Name"
} elseif ($organizationOption -eq "3") {
    $customUploadDate = Read-Host -Prompt "Enter Custom Upload Date [Format: YYYY-MM-DD]"
    $videoNameScheme = "($customUploadDate) %(title)s [%(id)s].%(ext)s"
} elseif ($organizationOption -eq "4") {
    $videoPath = Read-Host -Prompt "Enter Channel Name"
    $customUploadDate = Read-Host -Prompt "Enter Custom Upload Date [Format: YYYY-MM-DD]"
    $videoNameScheme = "($customUploadDate) %(title)s [%(id)s].%(ext)s"
}  else {
    Write-Output ""
    Write-Output "Invalid Option"
    Write-Output ""
    Write-Host -NoNewLine 'Press any key to exit...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

$url = Read-Host -Prompt "Enter URL"
$homePath = "E:/Video/"
$archivePath = $homePath + "Archive.txt"

yt-dlp `
    $url `
    -f "bv+ba/b" `
    -P "$homePath" `
    -o "$videoPath/$videoNameScheme" `
    --download-archive "$archivePath" `
    --embed-subs --embed-thumbnail --embed-metadata --embed-chapters --embed-info-json `
    --replace-in-metadata "title" "\|", "-" `
    --write-info-json -o "infojson:$videoPath/[Archive]/Info/$videoNameScheme" `
    --write-subs -o "subtitle:$videoPath/[Archive]/Subtitles/$videoNameScheme" `
    --write-link -o "link:$videoPath/[Archive]/Links/$videoNameScheme" `
    --write-description -o "description:$videoPath/[Archive]/Descriptions/$videoNameScheme" `
    --write-thumbnail -o "thumbnail:$videoPath/[Archive]/Thumbnails/$videoNameScheme" `
    -o "chapter:$videoPath/[Archive]/Chapters/$videoNameScheme" `
    -o "pl_description:$videoPath/[Archive]/Descriptions/Channel Description/$videoNameScheme" `
    -o "pl_infojson:$videoPath/[Archive]/Info/Channel Info/$videoNameScheme" `
    -o "pl_thumbnail:$videoPath/[Archive]/Thumbnails/Channel Icon/$videoNameScheme" `
    --write-comments --extractor-args "youtube:comment_sort=top;max_comments=50,all,0,0" `
    --remux-video "mp4/aac" `
    --merge-output-format "mp4" `
    --check-formats `
    --downloader "aria2c" `
    --sponsorblock-mark all 

Write-Output ""
Write-Output "Process Complete"
Write-Output ""
Write-Host -NoNewLine 'Press any key to exit...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
exit