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
if ($xml.streams.stream[0])
{
	# Hämta den första av flera tillgängliga strömmar
	$source = $xml.streams.stream[0].InnerText
}
else
{
	# Hämta den enda tillgängliga strömmen
	$source = $xml.streams.stream.InnerText
}
# Copy video stream and encode audio to fixed settings 
# $ffmpeg = "ffmpeg -i """+$source+""" -c:v copy -strict experimental """+$file+""""
# Copy both video and audio streams. Does not work with HLS streams from SVT
# $ffmpeg = "ffmpeg -i """+$source+""" -c copy """+$file+""""
# Copy video stream and apply bitstream filter to audio to comply with HLS streams from SVT
$ffmpeg = "ffmpeg -i """+$source+""" -c copy -bsf:a aac_adtstoasc """+$file+""""
Invoke-Expression $ffmpeg