# Video-Backup-Scripts

Just some personal scripts to download videos along with an organized archive of information.

### Requirements

* [yt-dlp](https://github.com/yt-dlp/yt-dlp)
* [TwitchDownloader](https://github.com/lay295/TwitchDownloader) - CLI Tool

## Usage

### YouTube

The YOUTUBEVIDEOCHANNEL script can be used for single videos or entire channel rips. The only thing that needs to be altered is the $homePath variable to your desired location.

The YOUTUBEPLAYLIST script can be used to rip any playlist from a channel. The $homePath variable should be changed here as well. This one is still being worked on.

### Twitch

The TWITCHVOD script and the TWITCHCHATFETCHER script should be placed in the same directory. The former is the only one that should be run. The latter is automatically used to fetch the chat logs for the VODs. The $homePath variable should be changed to your desired location here as well. Twitch VOD downloads have more naming restrictions than YouTube ones due to restrictions in the way that yt-dlp handles passing arguments to TwitchDownloader. The script will automatically rename the files to the proper format (ex. single quotes are replaced with semi-colons).
