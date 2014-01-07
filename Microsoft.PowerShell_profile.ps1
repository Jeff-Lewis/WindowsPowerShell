#Add-PSSnapin SqlServerCmdletSnapin100
#Add-PSSnapin SqlServerProviderSnapin100

Set-PSDebug -Strict

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