###
$files = Get-ChildItem | Where-Object {$_.Extension -eq ".cr2"}
ForEach ($file in $files) {
	$filenew = $file.Name + ".jpg"
Rename-Item $file $filenew
}
###
dir c:\work\*.abc | foreach { 
	$new = Join-path -Path $_.Directory -ChildPath "$($_.basename).xyz"
	Rename-Item $_.FullName $new -PassThru
}
###
$path = 'C:\temp\ImportantFile.txt'
Copy-Item -Path $path –Destination ([io.path]::ChangeExtension($path, '.bak')) -Verbose
###