<#
.SYNOPSIS
	Script used to remove unwanted applications from Android smartphones.
.DESCRIPTION
    Ever wanted to remove some system apps from your smartphone?
	
	The web it's surely full of partial or overly specific guides;
	with this script I'm trying to provide a simple way to perform
	this operation in the simplest and safest way possible:
	
	* No root required
	Packages are removed exclusively from the current user.
	
	* Backups by default
	The packages to be removed are pulled into a local folder.
	
	* Configurable behaviour
	Most of it can be changed with parameter flags.
.PARAMETER fileSelect
    Mandatory. Used to select the packages to operate on.
	Expects a file of packages with one package per line.
.PARAMETER pathBackup
	Optional. .\backup\ by default.
	Used to select a folder to put the pulled packages in.
.PARAMETER flagBackup
	Optional. $true dy default.
	Used to enable the package backup before removal.
.PARAMETER flagRemove
	Optional. $true dy default.
	Used to enable the package backup before removal.
.EXAMPLE
	Backups the packages defined by games.txt into the
	./backup folder and remove them from the device.

    adbtrick -fileSelect .\data\WAS-LX1A\games.txt
.EXAMPLE
	Backups the packages defined by aaa.txt
	file into the .\bbb\ folder and stops.

	adbtrick -fileSelect .\aaa.txt -pathBackup .\bbb\ -flagRemove $false
.NOTES
    Author: Claudio Venanzi
    Date:   May 18, 2019
#>

param
	([Parameter(Mandatory=$true)][string] $fileSelect
	,[Parameter(Mandatory=$false)][string]$pathBackup = ".\backup\"
	,[Parameter(Mandatory=$false)][bool]  $flagBackup = $true
	,[Parameter(Mandatory=$false)][bool]  $flagRemove = $true
)

# retrieve installed packages from device
$onDevice = ((& adb shell 'pm list packages -f' | sort) -split " ")

# setup the backup directory
if($flagBackup) {New-Item -ItemType Directory -Force -Path $pathBackup | Out-Null

# for each defined package that is also on the device
ForEach($package in Get-Content $fileSelect | Where {$_ }) {
	if($onDevice -contains $package) {
	
		Write-Host ("Checking "+$package);
		
		# removes the leading 'package:' from the package string and
		# splits it into the relative 'file' and 'class' substrings
		$pkgFile,$pkgClass = ($package.Replace("package:", "") -split ".apk=")
		$pkgFile = $pkgFile + ".apk"

		# perform the intended operations on the package
		if($flagBackup) {& adb pull $pkgFile $backup_d}		
		if($flagRemove) {& adb shell ('pm uninstall -k --user 0 '+$pkgClass)}
		
	} else {Write-Host ("Skipping "+$package);}
}

Write-Host "`r`nDone.`r`n"
