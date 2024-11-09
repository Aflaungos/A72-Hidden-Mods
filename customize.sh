#!/system/bin/sh

################### MODULE PARAMETERS ######################

MODEL=$(getprop ro.product.system.model)
VERSION=$(getprop ro.system.build.version.release)
CSC=$(getprop ro.csc.sales_code)
DATE=$(date +"%m-%d-%y")
INSTALL_START=$(date +"%s")
MODDIR="${0%/*}"

#################### CHECK DEVICE ##########################

if [[ "$MODEL" == "SM-M236B" | "SM-E236B"]]; then
   ui_print " Samsung Galaxy M23/F23 detected... "
else
   abort " Your phone is not a Samsung Galaxy M23/F23! "

if [[ "$VERSION" == "14" ]]; then
    ui_print " Android 14 Detected... "
elif [[ "$VERSION" == "13" ]]; then
    ui_print " Android 13 Detected... "
else
    ui_print " Android 12 Detected... "
    clear
    ui_print " Android 12 is not supported "
    abort

########################## INSTALL #########################

# Unzip Volume Key Selector Addon
unzip -o "$MODDIR/addon/VolumeKey-Selector.zip" -d "$MODDIR/addon/VolumeKey-Selector" &>/dev/null || abort "! Unzip failed"
# Run Volume Key Selector Addon if install scripts exist
if [ "$(ls -A "$MODDIR"/addon/*/install.sh 2>/dev/null)" ]; then
  for addon in "$MODDIR"/addon/*/install.sh; do
    . "$addon"
  done
fi

ui_print " _______________________________________________ "
ui_print " |--|---------------------------------------|--| "
ui_print " |--|           M23- Hidden Mods            |--| "
ui_print " |--|            Made by Mrsiri             |--| "
ui_print " |--|---------------------------------------|--| "
ui_print " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ "

sleep 1
clear

if [[ "$VERSION" == "14" ]]; then
    echo " Setting A14 Floating feature... "
    mv "$MODDIR"/system/etc/floating_feature_A14.xml "$MODDIR"/system/etc/floating_feature.xml
elif [[ "$VERSION" == "13" ]]; then
    echo " Setting A13 Floating feature... "
    mv "$MODDIR"/system/etc/floating_feature_A13.xml "$MODDIR"/system/etc/floating_feature.xml
fi


if [[ "$VERSION" == "14" ]]; then
	ui_print " ___________________________________________________ "
	ui_print " ------------ Do you want AI Features? ------------- "
	ui_print " "
	ui_print " ------- Volume up = Yes | Volume down = No -------- "
	ui_print " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ "
	if chooseport; then
  		echo " Installing AI Features... "
		sed -i '/SEC_FLOATING_FEATURE_AUDIO_CONFIG_INTERPRETER/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_CAMERA_CONFIG_AI_HIGH_RESOLUTION_MAX_CAPTURE/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_CAMERA_SUPPORT_AI_HIGH_RESOLUTION/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_CAMERA_SUPPORT_AIFRC/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_FRAMEWORK_CONFIG_SPEN_GARAGE_SPEC/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_FRAMEWORK_CONFIG_SPEN_VERSION/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_GENAI_SUPPORT/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_GRAPHICS_SUPPORT_CAPTURED_BLUR/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_MMFW_SUPPORT_AI_UPSCALER/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_SAIV/d' "$MODDIR"/system/etc/floating_feature.xml
		sed -i '/SEC_FLOATING_FEATURE_VISION_SUPPORT_AI_MY_FAVORITE_CONTENTS/d' "$MODDIR"/system/etc/floating_feature.xml

		replace "    <SEC_FLOATING_FEATURE_COMMON_SUPPORT_NATIVE_AI>TRUE" "    <SEC_FLOATING_FEATURE_COMMON_DISABLE_NATIVE_AI>TRUE" "$MODDIR"/system/etc/floating_feature.xml

		delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.photoremasterservice.xml
		delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.wallpaper.live.xml

		delete_recursive "$MODDIR"/system/app/VisualCloudCore
		delete_recursive "$MODDIR"/system/app/SmartCapture
		delete_recursive "$MODDIR"/system/app/SamsungNotesBase
		delete_recursive "$MODDIR"/system/etc/ailasso
		delete_recursive "$MODDIR"/system/etc/inpainting
		delete_recursive "$MODDIR"/system/etc/objectremoval
		delete_recursive "$MODDIR"/system/etc/reflectionremoval
		delete_recursive "$MODDIR"/system/etc/shadowremoval
		delete_recursive "$MODDIR"/system/etc/styletransfer
		delete_recursive "$MODDIR"/system/lib64
		delete_recursive "$MODDIR"/system/priv-app/PetService
		delete_recursive "$MODDIR"/system/priv-app/PhotoEditor_AIFull
		delete_recursive "$MODDIR"/system/priv-app/PhotoEditor_Mid
		delete_recursive "$MODDIR"/system/priv-app/PhotoRemasterService
		delete_recursive "$MODDIR"/system/priv-app/SpriteWallpaper
		delete_recursive "$MODDIR"/system/priv-app/WallpaperMagician-Stub
		delete_recursive "$MODDIR"/system/priv-app/wallpaper-res
		delete_recursive "$MODDIR"/system/vendor/wallpaper-res
	else
  		echo " Removing AI Features... "
	fi
fi

clear

ui_print " ___________________________________________________ "
ui_print " --------------- Do you want Bixby? ---------------- "
ui_print " "
ui_print " NOTE: For Bixby to work, the module will spoof your "
ui_print "      device as a Samsung Galaxy S24 (SM-S928B)      "
ui_print " "
ui_print " ------- Volume up = Yes | Volume down = No -------- "
ui_print " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ "
if chooseport; then
	echo " Installing Bixby... "
	sleep 0.3
else
	echo " Removing Bixby... "
	sed -i '/SEC_FLOATING_FEATURE_BIXBY/d' "$MODDIR"/system.prop
	sed -i '/SEC_FLOATING_FEATURE_BIXBYVISION/d' "$MODDIR"/system.prop
	sed -i '/SEC_FLOATING_FEATURE_COMMON_SUPPORT_BIXBY/d' "$MODDIR"/system.prop

	sed -i '/ro.product.model/d' "$MODDIR"/system.prop
	sed -i '/ro.product.system.model/d' "$MODDIR"/system.prop
	sed -i '/ro.product.vendor.model/d' "$MODDIR"/system.prop
	sed -i '/ro.product.odm.model/d' "$MODDIR"/system.prop

	delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.bixby.agent.xml
	delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.bixby.wakeup.xml

	delete_recursive "$MODDIR"/system/app/BixbyWakeup
	delete_recursive "$MODDIR"/system/priv-app/BixbyWakeup
	delete_recursive "$MODDIR"/system/priv-app/BixbyInterpreter
fi

clear

ui_print " ___________________________________________________ "
ui_print " --------- Do you want China Smart Manager? -------- "
ui_print " "
ui_print " ------- Volume up = Yes | Volume down = No -------- "
ui_print " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ "
if chooseport; then
	echo " Installing China Smart Manager... "
	sleep 0.5
else
	echo " Removing China Smart Manager... "

	# cscfeature=""$MODDIR"/optics/configs/carriers/single/$CSC/conf/system/cscfeature.xml"
	# cscfeature_decoded=""$MODDIR"/optics/configs/carriers/single/$CSC/conf/system/cscfeature_decoded.xml"
        # omc_decoder=""$MODDIR"/addon/omc_decoder.jar"
	# java -jar $omc_decoder -d -i $cscfeature -o $cscfeature_decoded

	delete_recursive "$MODDIR"/system/priv-app/SmartManagerCN
	delete_recursive "$MODDIR"/system/priv-app/SmartManager_v5
	delete_recursive "$MODDIR"/system/priv-app/Firewall
	delete_recursive "$MODDIR"/system/priv-app/DeviceSecurity
	delete_recursive "$MODDIR"/system/priv-app/AppLock

	delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.lool.xml
	delete ‎"$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.sm.devicesecurity.tcm_v6.xml
	delete "$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.sm.devicesecurity_v6.xml
	delete "$MODDIR"/system/etc/permissions/privapp-permissions-com.samsung.android.sm_cn.xml
	delete "$MODDIR"/system/etc/permissions/privapp-permissions-com.sec.android.app.firewall.xml

	replace "    <SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>com.samsung.android.sm.devicesecurity.tcm" "    <SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>com.samsung.android.sm.devicesecurity" "$MODDIR"/system/etc/floating_feature.xml
	replace "    <SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>com.samsung.android.sm_cn" "    <SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>com.samsung.android.lool" "$MODDIR"/system/etc/floating_feature.xml
	
	sed -i '/SEC_FLOATING_FEATURE_COMMON_SUPPORT_NAL_PRELOADAPP_REGULATION/d' "$MODDIR"/system/etc/floating_feature.xml
fi

clear

ui_print " ___________________________________________________ "
ui_print " --------- Do you want S24 Boot Animation? --------- "
ui_print " "
ui_print " ------- Volume up = Yes | Volume down = No -------- "
ui_print " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ "
if chooseport; then
	echo " Installing S24 Boot Animation... "
	sleep 0.2
else
	echo " Removing S24 Boot Animation... "

	delete_recursive "$MODDIR"/system/media
fi

clear

########################## CLEANUP #########################

[ -d "$MODDIR/addon/" ] && rm -rf $MODDIR/addon/

###################### INSTALL FINISH ######################

INSTALL_END=$(date +"%s")
DIFF=$(($INSTALL_END - $INSTALL_START))

INSTALL_SUCCESS=$?

if [ $INSTALL_SUCCESS != 0 ]; then
	abort "Error: Installation failed"
fi
echo -e "Installation finished in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds"