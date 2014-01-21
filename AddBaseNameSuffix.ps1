$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes",""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No",""
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no)
$files = Get-ChildItem -Filter "*.jpg" | Sort Name
$numFiles = @($files).Count
$result = $host.UI.PromptForChoice("","Process $numFiles photos?",$options,0) 
if (!$result -and $numFiles)
{
    $counter = 1
    foreach ($file in $files)
    {
		Write-Host -NoNewline "Processing file $($file.FullName)"
        $filename = $file.BaseName.Substring(0,10) + "-" + $counter.ToString("0000") + $file.Extension
        Rename-Item $file.FullName -NewName $filename
        Write-Host -ForegroundColor Yellow "Renamed $($file.Name) to $filename"
        $counter++
    }
}
Write-Host -ForegroundColor Green "Processing Complete!"