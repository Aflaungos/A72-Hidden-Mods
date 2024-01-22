![m23banner](https://github.com/Aflaungos/A72-Hidden-Mods/blob/main/MagiskMod.jpg)
# M23-Hidden-Mods OneUI 6
A magisk module adding the mods from ShaDisNX255's NcX ROM [XDA-Thread](https://forum.xda-developers.com/t/samsung-galaxy-a71-working-mods.4173295/)  and based on ULTRAHQ's repo, plus many extra mods systemlessly!<br/>
Thanks ShaDisNX255 for allowing me to use your features! Without you, this project would've never started.

[XDA Thread of M23 Hidden Mods] https://forum.xda-developers.com/t/mod-oneui-m23-hidden-mods.4626443/

### Installation:
1. Download the module from the releases
2. Open the magisk app and go to modules
3. Click the "Install from storage" button and select the .zip you just downloaded 

> Note: It should only be used on the Galaxy M23/F23 (SM-M236B/SM-E236B) running the corresponding android security patch version as written in the releases. <br/>The changes are always reversile, by simply removing the module in magisk.

### Troubleshooting:
- Back Camera 1080p 60FPS: Video stutters, disable auto fps and stabilization
- If camera app crashes (or other issues like error on 50MP mode) please clear camera app data.
- If system apps start crashing, boot into your Recovery and on
  <details open>
  <summary>Stock recovery</summary>
  1. Wipe cache partition</br>
  </details>
  <details open>
  <summary>TWRP recovery</summary>
  1. Wipe cache partition</br>2. Wipe dalvik cache
  </details>
- To fix Samsung Health root detection, I recommend using [KnoxPatch](https://github.com/BlackMesa123/KnoxPatch/releases)

### Known bugs:
- Back Camera 1080p 60FPS at 0.5x: Video stutters
- Back Camera 2160p 60FPS: Crashes Camera
- Please report, if you find any

#### Added OS Features:
- High-End Animations
- Enhanced CPU Responsiveness
- Added High Performance mode (also known as Enhanced Processing mode)
- ADPS (Wi-Fi Power Saving)

#### Added Camera Features:
- Full Beauty features (Beauty in Live Focus, Beauty Brighten, Body Beauty, change skin tone)
- Torch Flash in Live Focus
- Review feature
- Audio Input Control (In pro video mode - Limitation: Only internal microphone)
- Improved Scene Detection
- Video Audio Zoom
- Full Intelligent Recognition (like Smart Scan Text Extraction)
- Full Live Focus (all S-Series effects)
- Higher Gallery Zoom Quality
- Video Auto FPS
