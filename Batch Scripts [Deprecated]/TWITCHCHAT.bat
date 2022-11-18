@echo off
echo. 
echo "%1-chat.json"
echo.
set /P vodid="Enter VOD ID: "
set jsonpath="%*-chat.json"
set renderpath="%*-chat_render.mp4"
TwitchDownloaderCLI -m ChatDownload --embed-emotes --id %vodid% -o "%jsonpath%" --threads 4
TwitchDownloaderCLI -m ChatRender -i %jsonpath% -h 1080 -w 422 --font-size 18 -o %renderpath% --threads 4