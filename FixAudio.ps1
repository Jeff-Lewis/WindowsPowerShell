$InputDirectory = "C:\Users\Daniel\Videos\Lilla prinsessan"
$OutputDirectory = "C:\Users\Daniel\Videos\Klara\Lilla prinsessan"
Get-ChildItem $InputDirectory -Include *.mp4 -Recurse | foreach ($_) {
    $InputFile = $_.FullName
    #$OutputFile = $_.DirectoryName+"\"+$_.BaseName+"-ok"+$_.Extension
    $OutputFile = $OutputDirectory+"\"+$_.BaseName+$_.Extension
    $FFmpeg = "ffmpeg -i ""$InputFile"" -c:v copy -strict experimental ""$OutputFile"""
    Invoke-Expression $FFmpeg
}