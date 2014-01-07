# Renames a folder of photos for printing using the capture date as the file name
# Based on PowerShell script to name photos for printing by Nicholas Armstrong, Jan 2010

Write-Output "Renames a folder of photos for printing using the capture date as the file name"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", ""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", ""
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$files = Get-ChildItem -Filter "*.jpg" | sort name
$numFiles = @($files).Count
$result = $host.ui.PromptForChoice("", "Name $numFiles photos?", $options, 0) 
if (!$result -and $numFiles)
{
    # Load the assemblies needed for reading and parsing EXIF
    [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") > $null
    [System.Reflection.Assembly]::LoadWithPartialName("System.Text") > $null
    foreach ($file in $files)
    {
		Write-Output "Processing file $file"
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
		$number = 0
        # $filename = "{0}-{1}-{2} {3}.{4}.{5} {6}.jpg" -f $year, $month, $day, $hour, $minute, $second, $number
        $filename = "{0}-{1}-{2} {3}.{4}.{5}.jpg" -f $year, $month, $day, $hour, $minute, $second
		#TODO Need a new pattern to even check if filename is equal to an incremented number and if so to leave the file alone
        # If file is named correctly, do not rename
        if (!$file.Name.Equals($filename))
        {
			# If filename already exists, use incrementing counter to avoid conflicts
            while (Test-Path $filename)
            {
                $number++
                $filename = "{0}-{1}-{2} {3}.{4}.{5} ({6}).jpg" -f $year, $month, $day, $hour, $minute, $second, $number
            }
            # Rename the photo with the known-good filename
            Rename-Item $file.FullName -NewName $filename
            Write-Output "Renamed $file to $filename"
        }
		else
		{
			Write-Output "No need to rename file $file"
		}
    }
}
Write-Output "Processing Complete"
