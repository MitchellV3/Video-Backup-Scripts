Write-Output "----------Twitch Chat----------"
mkdir -p $args[3]
mkdir -p $args[4]
$jsonPath = $args[0] + "-chat.json" -replace "'", ""
$renderPath = $args[1] + "-chat_render.mp4" -replace "'", ""
$vodId = $args[2].Split("/")[-1]
Write-Output $vodId
TwitchDownloaderCLI `
    -m ChatDownload `
    --embed-emotes `
    --id $vodId `
    -o "$jsonPath" `
    --threads 4
TwitchDownloaderCLI `
    -m ChatRender `
    -i $jsonPath `
    -h 1080 -w 422 `
    --font-size 18 `
    -o $renderPath `
    --threads 4

PowerShell -NoExit
