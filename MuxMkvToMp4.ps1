# MuxMkvToMp4
Write-Output "Mux MKV to MP4"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", ""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", ""
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$files = Get-ChildItem -Filter "*.mkv" | sort name
$numFiles = @($files).Count
$result = $host.ui.PromptForChoice("", "Process $numFiles MKV-files?", $options, 0)
if (!$result -and $numFiles)
{
    Write-Output "Processing..."
    foreach ($file in $files)
	{
		ffmpeg -i $file -acodec copy -vcodec copy ($file.BaseName+".mp4")
		Write-Output "Muxed $file"
    }
}
Write-Output "Processing Complete"