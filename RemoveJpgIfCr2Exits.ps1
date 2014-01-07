# Clean up our photo collection from JPG-files if we have a corresponding CR2-file
Write-Output "Remove JPG-files that have a corresponding CR2-file in current directory"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", ""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", ""
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$files = Get-ChildItem -Filter "*.jpg" | sort name
$numFiles = @($files).Count
$result = $host.ui.PromptForChoice("", "Process $numFiles JPG-files?", $options, 0)
if (!$result -and $numFiles)
{
    Write-Output "Processing..."
    foreach ($file in $files)
	{
		if(Test-Path($file.BaseName+".CR2"))
		{
			Remove-Item $file
            Write-Output "Removed $file"
		}
		else
		{
            Write-Output "Saved $file"
		}
    }
}
Write-Output "Processing Complete"