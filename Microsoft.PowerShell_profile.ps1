#Add-PSSnapin SqlServerCmdletSnapin100
#Add-PSSnapin SqlServerProviderSnapin100

#Import-Module PowerShellPack # http://archive.msdn.microsoft.com/PowerShellPack

Set-PSDebug -Strict

#Set-Alias Fix command to use QNAP shared drives

Set-Alias rc Edit-PowershellProfile

Function Prompt {
	$mywd = (Get-Location).Path
	$mywd = $mywd.Replace( $HOME, '~' )
	Write-Host "PS " -NoNewline -ForegroundColor DarkGreen
	Write-Host ("" + $mywd + ">") -NoNewline -ForegroundColor Green
	return " "
}

Function Edit-PowershellProfile {
	notepad $Profile
}