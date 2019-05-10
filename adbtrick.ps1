
#######################
# BASIC CONFIGURATION #
#######################
# (e)xecutables - paths to executables
# (d)irectories - paths with trailing '\'
# (f)lags       - $true | $false

$binary_e = ".\platform-tools\adb.exe"
$backup_d = ".\backup\"
$backup_f = $true
$remove_f = $true

##########################
# ADVANCED CONFIGURATION #
##########################
# A complete reference of all the software present by default can be found
# in the companion file: /data/WAS-LX1A_SW.txt

$selection = @(

	# GAMES
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/SpiderManUltimatePower/SpiderManUltimatePower.apk=com.gameloft.android.GloftSMIF"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/DisneyMagicKingdom/DisneyMagicKingdom.apk=com.gameloft.android.GloftDMKF"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/PGA_ScratchCard/PGA_ScratchCard.apk=com.gameloft.android.GloftSCCA"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/AsphaltNitro/AsphaltNitro.apk=com.gameloft.android.GloftANPH"

	# INSTAGRAM
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Instagram_Stub/Instagram_Stub.apk=com.instagram.android"
	
	# FACEBOOK
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Facebook_Services/Facebook_Services.apk=com.facebook.services"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Facebook_Stub/Facebook_Stub.apk=com.facebook.katana"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Appmanager/Appmanager.apk=com.facebook.appmanager"
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Installer/Installer.apk=com.facebook.system"
	
	# TWITTER
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/Twitter/Twitter.apk=com.twitter.android"
	
	# HUAWEI NOTEPAD
	,"package:/system/priv-app/HwNotePad/HwNotePad.apk=com.example.android.notepad"

	# HUAWEI CLONE
	,"package:/system/delapp/PhoneClone_OVE/PhoneClone_OVE.apk=com.hicloud.android.clone"

	# HUAWEI MUSIC
	,"package:/system/priv-app/HwMediaCenter/HwMediaCenter.apk=com.android.mediacenter"
	
	# HUAWEI MIRROR
	,"package:/system/delapp/HwMirror/HwMirror.apk=com.android.hwmirror"
	
	# HUAWEI APPGALLERY
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/HiSpace/HiSpace.apk=com.huawei.appmarket"
	
	# HUAWEI THEME MANAGER
	,"package:/system/app/HwThemeManager/HwThemeManager.apk=com.huawei.android.thememanager"

	# HUAWEI VIDEO
	,"package:/system/priv-app/HiMovie/HiMovie.apk=com.huawei.himovie.overseas"
	
	# HUAWEI HEALTH
	,"package:/data/hw_init/version/region_comm/oversea/app/HwHealthPlatform_OVE/HwHealthPlatform_OVE.apk=com.huawei.health"

	# HUAWEI GAME SUITE
	,"package:/data/hw_init/product/app/HwGameAssistant/HwGameAssistant.apk=com.huawei.gameassistant"	

	# HUAWEI TIPS
	,"package:/system/app/HwSmartSuggestion/HwSmartSuggestion.apk=com.huawei.tips"
	,"package:/system/delapp/HwEmuiManual/HwEmuiManual.apk=com.huawei.android.tips"

	# HUAWEI COMPASS
	,"package:/system/delapp/HwCompass/HwCompass.apk=com.huawei.compass"

	# HUAWEI BACKUP
	,"package:/system/delapp/HwBackup_Local/HwBackup_Local.apk=com.huawei.KoBackup"

	# HUAWEI WEATHER
	,"package:/system/priv-app/HwWeatherClock/HwWeatherClock.apk=com.huawei.android.totemweather"
	,"package:/system/priv-app/HwWeatherClockApp/HwWeatherClockApp.apk=com.huawei.android.totemweatherapp"
	,"package:/system/priv-app/HwWeatherClockWidget/HwWeatherClockWidget.apk=com.huawei.android.totemweatherwidget"

	# HUAWEI ONLINE FOLDER
	,"package:/cust/hw/eu/app/HiFolder/HiFolder.apk=com.huawei.hifolder"

	# HUAWEI ONLINE ID
	,"package:/cust/hw/eu/app/HMS/HMS.apk=com.huawei.hwid"

	#--------------------------------------------------------------------------
	
	# GOOGLE SEARCH WIDGET
	,"package:/system/priv-app/Velvet/Velvet.apk=com.google.android.googlequicksearchbox"

	# GOOGLE PLAY MUSIC
	,"package:/system/app/Music2/Music2.apk=com.google.android.music"

	# GOOGLE PLAY FILM
	,"package:/system/app/Videos/Videos.apk=com.google.android.videos"

	# GOOGLE PHOTO
	,"package:/system/app/Photos/Photos.apk=com.google.android.apps.photos"

	# GOOGLE DUO
	,"package:/system/app/Duo/Duo.apk=com.google.android.apps.tachyon"
	
	# GOOGLE EDIT DOCS
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/EditorsDocs/EditorsDocs.apk=com.google.android.apps.docs.editors.docs"

	# GOOGLE EDIT SHEETS
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/EditorsSheets/EditorsSheets.apk=com.google.android.apps.docs.editors.sheets"
	
	# GOOGLE EDIT SLIDES
	,"package:/data/hw_init/version/special_cust/WAS-L01A/hw/eu/app/EditorsSlides/EditorsSlides.apk=com.google.android.apps.docs.editors.slides"     
)

#################
# PROGRAM LOGIC #
#################
# Here be dragons.

$on_device = ((& $binary_e shell 'pm list packages -f' | sort) -split " ")

New-Item -ItemType Directory -Force -Path $backup_d | Out-Null

ForEach ($package In $selection) {
	if($on_device -contains $package) {
		Write-Host ("`r`nPackage: "+$package);
		
		# PACKAGE SETUP
		$splitted = ($package.Replace("package:", "") -split ".apk=")
		
		# BACKUP STEP
		if($backup_f) {& $binary_e pull ($splitted[0]+".apk") $backup_d}
	
		# DELETE STEP
		if($remove_f) {& $binary_e shell ('pm uninstall -k --user 0 '+$splitted[1])}		
	}
}

Write-Host "`r`nDone.`r`n"
