# Renames a folder of photos for printing using the capture date as the file name
# Based on PowerShell script to name photos for printing by Nicholas Armstrong, Jan 2010

Write-Host -ForegroundColor Green "Renames a folder of photos using the capture date and existing counter as file name"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes",""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No",""
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no)
$files = Get-ChildItem -Filter "*.jpg" | Sort Name
$numFiles = @($files).Count
$result = $host.UI.PromptForChoice("","Process $numFiles photos?",$options,0) 
if (!$result -and $numFiles)
{
    # Load the assemblies needed for reading and parsing EXIF
    [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") > $null
    [System.Reflection.Assembly]::LoadWithPartialName("System.Text") > $null
    foreach ($file in $files)
    {
		Write-Host -NoNewline "Processing file $($file.FullName)"
        # Load image and get EXIF date
        $photo = [System.Drawing.Image]::FromFile($file.FullName)
        try
        {
            $dateProp = $photo.GetPropertyItem(36867)
        }
        catch
        {
            try
            {
                $dateProp = $photo.GetPropertyItem(306)
            }
            catch
            {
                continue
            }
        }
        $photo.Dispose()
        # Convert date taken metadata to appropriate fields
        $encoding = New-Object System.Text.UTF8Encoding
        $date = $encoding.GetString($dateProp.Value).Trim()
        $year = $date.Substring(0,4)
        $month = $date.Substring(5,2)
        $day = $date.Substring(8,2)
		$hour = $date.Substring(11,2)
		$minute = $date.Substring(14,2)
		$second = $date.Substring(17,2)
        # Set default filename
        $id = $file.BaseName.Substring(4,4)
        #$filename = "{0}-{1}-{2} {3}.{4}.{5}.jpg" -f $year,$month,$day,$hour,$minute,$second
        $filename = "{0}-{1}-{2}-{3}.jpg" -f $year,$month,$day,$id
		#TODO Need a new pattern to even check if filename is equal to an incremented number and if so to leave the file alone
        #TODO Better is to add current counter from filename and just add the date in front of it
        # If file is named correctly, do not rename
        if (!$file.Name.Equals($filename))
        {
			# Check if filename already exists
            $counter = 0
            while (Test-Path $filename)
            {
                $counter++
                #$filename = "{0}-{1}-{2} {3}.{4}.{5} copy{6}.jpg" -f $year,$month,$day,$hour,$minute,$second,$counter
                $filename = "{0}-{1}-{2}-{3}-copy{4}.jpg" -f $year,$month,$day,$id,$counter
            }
            # Rename the photo with the known-good filename
            Rename-Item $file.FullName -NewName $filename
            Write-Host -ForegroundColor Yellow "Renamed to $filename"
        }
		else
		{
			Write-Host "No need to rename file."
		}
    }
}
Write-Host -ForegroundColor Green "Processing Complete!"