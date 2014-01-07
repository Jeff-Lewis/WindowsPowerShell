# Get-VideoStream.ps1
param
(
    [String] $url,
    [String] $file
)
# Hämta stream info via http://pirateplay.se/api/get_streams.xml?url=EscapedURL
$ppapi = "http://pirateplay.se/api/get_streams.xml?url="+[system.uri]::EscapeDataString($url)
$xml = [xml](New-Object net.webclient).DownloadString($ppapi)
# Hämta stream med ffmpgeg till filnamn
$ffmpeg = "ffmpeg -i """+$xml.streams.stream[0].InnerText+""" -c:v copy -strict experimental """+$file+""""
# $ffmpeg = "ffmpeg -i """+$xml.streams.stream[0].InnerText+""" -c copy -bsf:a aac_adtstoasc """+$file+""""
Invoke-Expression $ffmpeg
