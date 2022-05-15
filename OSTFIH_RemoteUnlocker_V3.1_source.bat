@echo off
title OSTFIH_RemoteUnlocker V1.0.3.1
COLOR 0B
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Hi there!!
echo Let's start Unlocking the bootloader of your HMD Gloabal Nokia Phones
echo.
echo Please read the terms before you proceed...
echo ===========================================
echo 1) This script is written by CRUECY and used to unlock bootloader of 1st and 2nd GEN of Nokia devices.
echo    Trying to attempt in non supported devices, you may Bricked your device.
echo 2) Your data will be wiped while unlocking the bootloader, make sure you took the backup before you proceed.
echo 3) If you know how to calculate challenge code, then you can able to use this application, otherwise you've
echo    to contact me for "BootloaderUnlocking"
echo    --------------------------------------------------------------------------
echo    NOTE: [REQUIRED SPECIAL SERVER ACCESS, AVERAGE PERSON CAN'T OBTAIN THAT]
echo    --------------------------------------------------------------------------
echo.
echo If you're agreeing with above terms, PRESS ANY KEY TO CONTINUE. . .
pause>nul
cls

:strt
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Supported models are listed below...
echo ********************************************
echo  A. [E1M] Nokia 2                          
echo  B. [ND1] Nokia 5                           
echo  C. [PLE] Nokia 6                           
echo  D. [C1N] Nokia 7                           
echo  E. [NB1] Nokia 8                           
echo  F. [ES2] Nokia 3.1                         
echo  G. [CO2] Nokia 5.1                         
echo  H. [PL2] Nokia 6.1                         
echo  I. [CTL] Nokia 7.1   
echo  J. [ROO] Nokia 3.1 Plus                     
echo  K. [PDA] Nokia 5.1 Plus                    
echo  L. [DRG] Nokia 6.1 Plus                    
echo  M. [B2N] Nokia 7 plus                      
echo  N. [A1N] Nokia 8 Sirocco                   
echo ********************************************
echo Please choose your device by entering the following letter from above.
echo For example "[PL2] Nokia 6.1", Enter: "H"
echo.
set /p fih=Input your choice here: 
cls
if %fih% == A goto E1M
if %fih% == a goto E1M
if %fih% == B goto ND1
if %fih% == b goto ND1
if %fih% == C goto PLE
if %fih% == c goto PLE
if %fih% == D goto C1N
if %fih% == d goto C1N
if %fih% == E goto NB1
if %fih% == e goto NB1
if %fih% == F goto ES2
if %fih% == f goto ES2
if %fih% == G goto CO2
if %fih% == g goto CO2
if %fih% == H goto PL2
if %fih% == h goto PL2
if %fih% == I goto CTL
if %fih% == i goto CTL
if %fih% == J goto ROO
if %fih% == j goto ROO
if %fih% == K goto PDA
if %fih% == k goto PDA
if %fih% == L goto DRG
if %fih% == l goto DRG
if %fih% == M goto B2N
if %fih% == m goto B2N
if %fih% == N goto A1N
if %fih% == n goto A1N
goto strt



:: 1) Commands for Nokia 6.1 [PL2]
:PL2
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\PL2-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_PL2
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_PL2
:allow_PL2
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\PL2-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\PL2-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\PL2-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\PL2-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_PL2
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_PL2
if "%Challenge%"=="fail" goto challengeUIDfail_PL2
:allowUID_PL2
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
del %temp%\encUID.bin 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause>nul
cls
goto strt
:: Commands for Veracity_Approval Nokia_6.1[PLATE2]
:challengepass_PL2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_PL2
:challengefail_PL2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto PL2
:: Commands for UID_Approval Nokia_6.1[PLATE2]
:challengeUIDpass_PL2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_PL2
:challengeUIDfail_PL2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_PL2


:: 2) Commands for Nokia X6 [DRG]
:DRG
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\DRG-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_DRG
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_DRG
:allow_DRG
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\DRG-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\DRG-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\DRG-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\DRG-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_DRG
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_DRG
if "%Challenge%"=="fail" goto challengeUIDfail_DRG
:allowUID_DRG
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
del %temp%\encUID.bin 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause>nul
cls
goto strt
:: Commands for Veracity_Approval Nokia X6 [DRAGON]
:challengepass_DRG
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_DRG
:challengefail_DRG
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 5 /nobreak > nul
cls
goto DRG
:: Commands for UID_Approval Nokia X6 [DRAGON]
:challengeUIDpass_DRG
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_DRG
:challengeUIDfail_DRG
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 5 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_DRG


:: 3) Commands for Nokia 7 Plus [B2N]
:B2N
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 2 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\B2N-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_B2N
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_B2N
:allow_B2N
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\B2N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\B2N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\B2N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\B2N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_B2N
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_B2N
if "%Challenge%"=="fail" goto challengeUIDfail_B2N
:allowUID_B2N
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 7Plus [B2N]
:challengepass_B2N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_B2N
:challengefail_B2N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto B2N
:: Commands for UID_Approval Nokia 7Plus [B2N]
:challengeUIDpass_B2N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_B2N
:challengeUIDfail_B2N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_B2N

:: 4) Commands for Nokia 7.1 [CTL]
:CTL
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 2 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\CTL-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_CTL
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_CTL
:allow_CTL
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\CTL-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\CTL-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\CTL-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\CTL-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_CTL
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_CTL
if "%Challenge%"=="fail" goto challengeUIDfail_CTL
:allowUID_CTL
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 7.1 [CRYSTAL]
:challengepass_CTL
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_CTL
:challengefail_CTL
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto CTL
:: Commands for UID_Approval Nokia 7.1 [CRYSTAL]
:challengeUIDpass_CTL
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_CTL
:challengeUIDfail_CTL
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_CTL

:: 5) Commands for Nokia 8 [NB1]
:NB1
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 2 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\NB1-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_NB1
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_NB1
:allow_NB1
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\NB1-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\NB1-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\NB1-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\NB1-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_NB1
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_NB1
if "%Challenge%"=="fail" goto challengeUIDfail_NB1
:allowUID_NB1
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 8 [NB1]
:challengepass_NB1
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_NB1
:challengefail_NB1
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto NB1
:: Commands for UID_Approval Nokia 8 [NB1]
:challengeUIDpass_NB1
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_NB1
:challengeUIDfail_NB1
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_NB1

:: 6) Commands for Nokia 8 Sirocco [A1N]
:A1N
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 2 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\A1N-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_A1N
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_A1N
:allow_A1N
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\A1N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\A1N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\A1N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\A1N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_A1N
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_A1N
if "%Challenge%"=="fail" goto challengeUIDfail_A1N
:allowUID_A1N
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 8 Sirocco [A1N]
:challengepass_A1N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_A1N
:challengefail_A1N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto A1N
:: Commands for UID_Approval Nokia 8 Sirocco [A1N]
:challengeUIDpass_A1N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_A1N
:challengeUIDfail_A1N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_A1N

:: 7) Commands for Nokia 7 [C1N]
:C1N
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 2 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\C1N-xbl_service.elf 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_C1N
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_C1N
:allow_C1N
.\data\fastboot\fastboot.exe -s %psn% flash xbl_a .\data\bl\C1N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash xbl_b .\data\bl\C1N-xbl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_a .\data\bl\C1N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% flash abl_b .\data\bl\C1N-abl_service.elf
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_C1N
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_C1N
if "%Challenge%"=="fail" goto challengeUIDfail_C1N
:allowUID_C1N
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 7 [C1N]
:challengepass_C1N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_C1N
:challengefail_C1N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto C1N
:: Commands for UID_Approval Nokia 7 [C1N]
:challengeUIDpass_C1N
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_C1N
:challengeUIDfail_C1N
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_C1N

:: 8) Commands for Nokia 2 [E1M]
:E1M
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastbootfih.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\E1M-appsboot_service.mbn 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_E1M
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_E1M
:allow_E1M
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\E1M-appsboot_service.mbn
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_E1M
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_E1M
if "%Challenge%"=="fail" goto challengeUIDfail_E1M
:allowUID_E1M
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem unlock-go 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 2 [E1M]
:challengepass_E1M
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_E1M
:challengefail_E1M
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto E1M
:: Commands for UID_Approval Nokia 2 [E1M]
:challengeUIDpass_E1M
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_E1M
:challengeUIDfail_E1M
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_E1M

:: 9) Commands for Nokia 5 [ND1]
:ND1
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastbootfih.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\D1C-appsboot_service.mbn 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_ND1
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_ND1
:allow_ND1
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\D1C-appsboot_service.mbn
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_ND1
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_ND1
if "%Challenge%"=="fail" goto challengeUIDfail_ND1
:allowUID_ND1
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem unlock-go 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 5 [ND1]
:challengepass_ND1
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_ND1
:challengefail_ND1
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto ND1
:: Commands for UID_Approval Nokia 5 [ND1]
:challengeUIDpass_ND1
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_ND1
:challengeUIDfail_ND1
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_ND1

:: 10) Commands for Nokia 6 [PLE]
:PLE
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastbootfih.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\D1C-N6-appsboot_service.mbn 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_PLE
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_PLE
:allow_PLE
.\data\fastboot\fastboot.exe -s %psn% flash aboot .\data\bl\D1C-N6-appsboot_service.mbn
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_PLE
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_PLE
if "%Challenge%"=="fail" goto challengeUIDfail_PLE
:allowUID_PLE
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/2)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to complete rest of the unlock process]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem unlock-go 2>nul
pause>nul
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem fih on 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock off 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem devlock allow_unlock 2>nul
echo.
echo Started critical unlocking for %psn% (2/2)...
echo ...........................................................
echo Note: Please look at your phone again, and proceed the CRITICAL UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% flashing unlock_critical 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem device-info 2>&1 | findstr /V panel | findstr bootloader | .\data\bin\sed.exe "s/\t//g" | .\data\bin\sed.exe "s/(bootloader) //g" | .\data\bin\sed.exe "s/^Device tampered: /System Tampered: /g" | .\data\bin\sed.exe "s/^Device unlocked: /Device Unlock: /g" | .\data\bin\sed.exe "s/^Device critical unlocked: /Device Critical Unlock: /g" | .\data\bin\sed.exe "s/^Charger screen enabled: /Power-Off Charging Animation: /g"  | .\data\bin\sed.exe "s/^Verity mode: /Verity Mode: /g"  | .\data\bin\sed.exe "s/true/Yes/g" | .\data\bin\sed.exe "s/false/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 6 [PLATE]
:challengepass_PLE
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_PLE
:challengefail_PLE
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto PLE
:: Commands for UID_Approval Nokia 6 [PLATE]
:challengeUIDpass_PLE
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_PLE
:challengeUIDfail_PLE
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_PLE

:: 11) Commands for Nokia 3.1 [ES2]
:ES2
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastbootfih.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\ES2-lk_service.img 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_ES2
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_ES2
:allow_ES2
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\ES2-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% flash lk_b .\data\bl\ES2-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_ES2
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_ES2
if "%Challenge%"=="fail" goto challengeUIDfail_ES2
:allowUID_ES2
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/1)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 3.1 [ES2]
:challengepass_ES2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_ES2
:challengefail_ES2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto ES2
:: Commands for UID_Approval Nokia 3.1 [ES2]
:challengeUIDpass_ES2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_ES2
:challengeUIDfail_ES2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_ES2

:: 12) Commands for Nokia 5.1 [CO2]
:CO2
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastbootfih.exe -s %psn% flash veracity %temp%\veracity.bin 2>nul
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\CO2-lk_service.img 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_CO2
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_CO2
:allow_CO2
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\CO2-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% flash lk_b .\data\bl\CO2-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_CO2
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>nul 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_CO2
if "%Challenge%"=="fail" goto challengeUIDfail_CO2
:allowUID_CO2
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/1)...
echo .............................................................
echo Note: Please look at your phone again, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
goto strt
:: Commands for Veracity_Approval Nokia 5.1 [CO2]
:challengepass_CO2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_CO2
:challengefail_CO2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto CO2
:: Commands for UID_Approval Nokia 5.1 [CO2]
:challengeUIDpass_CO2
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_CO2
:challengeUIDfail_CO2
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_CO2

:: 13) Commands for Nokia 5.1 Plus [PDA]
:PDA
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastboot.exe -s %psn% getvar current-slot 2>&1 | findstr /C:"current-slot" > %temp%\deviceSlot.txt
for /f "tokens=1* delims= " %%A in ( %temp%\deviceSlot.txt ) Do Set deviceSlot=%%B
del %temp%\deviceSlot.txt
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\PDA-lk_service.img 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_PDA
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_PDA
:allow_PDA
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\PDA-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% flash lk_b .\data\bl\PDA-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_PDA
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_PDA
if "%Challenge%"=="fail" goto challengeUIDfail_PDA
:allow_UIDPDA
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/1)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
del %temp%\encUID.bin 2>nul
goto strt
:: Commands for Veracity_Approval Nokia 5.1Plus [PANDA]
:challengepass_PDA
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_PDA
:challengefail_PDA
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto PDA
:: Commands for UID_Approval Nokia 5.1Plus [PANDA]
:challengeUIDpass_PDA
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_PDA
:challengeUIDfail_PDA
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_PDA


:: 14) Commands for Nokia 3.1 Plus [ROO]
:ROO
echo Welcome to OSTFIH_RemoteUnlocker                          \/
echo This tool is Developed by CRUECY                          /\
echo Contributor: CRUECY                                       \/
echo Version: v1.0.3.1_initial_released                        /\
echo Contact: https://t.me/CRUECY                              \/
echo Copyright (C) 2021 Dev_CRUECY-NOKIA. All Rights Reserved. /\
echo ============================================================
echo.
echo Please connect your phone under (Download/fastboot mode)...
.\data\fastboot\fastboot.exe oem alive 2>nul
ping localhost -n 1 >nul
for /f %%i in ( '.\data\fastboot\fastboot.exe devices' ) do set psn=%%i
echo.
echo Device Attached: %psn%
echo ========================================================
echo ====== Device info ======
echo       -------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastboot.exe -s %psn% getvar current-slot 2>&1 | findstr /C:"current-slot" > %temp%\deviceSlot.txt
for /f "tokens=1* delims= " %%A in ( %temp%\deviceSlot.txt ) Do Set deviceSlot=%%B
del %temp%\deviceSlot.txt
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getBrandCode 2>&1 | findstr getBrandCode > %temp%\brandcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\brandcode.txt ) Do set brandcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem dm-veracity 2>&1 | findstr veracity > %temp%\veracity.txt
for /f "tokens=1* delims= " %%A in ( %temp%\veracity.txt ) Do set veracity=%%B
del %temp%\veracity.txt
del %temp%\brandcode.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo Brand Code: %brandcode%
echo DM-Veracity: %veracity%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature Code: 
echo %Signature% > %temp%\Signature.txt
set Signature=pass
>nul certutil -f -decode %temp%\Signature.txt %temp%\veracity.bin
del %temp%\Signature.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash veracity %temp%\veracity.bin
del %temp%\veracity.bin
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\PDA-lk_service.img 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if "%Challenge%"=="Pass" goto challengepass_ROO
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="fail" goto challengefail_ROO
:allow_ROO
.\data\fastboot\fastboot.exe -s %psn% flash lk_a .\data\bl\ROO-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% flash lk_b .\data\bl\ROO-lk_service.img
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader
echo ========================================================
:retry_ROO
echo ====== Device RootStatus ======
echo       -------------------
.\data\fastboot\fastboot.exe -s %psn% oem getversions 2>&1 | findstr bootloader | .\data\bin\sed.exe "s/(bootloader) //g"| .\data\bin\sed.exe "s/^model=/Hardware SKU: /g" | .\data\bin\sed.exe "s/^sub_model=/Branch SKU: /g" | .\data\bin\sed.exe "s/^software version=/FIH Build Version: /g" | .\data\bin\sed.exe "s/^SW model=/Firmware Region: /g" | .\data\bin\sed.exe "s/^build number=/Revision: /g" | .\data\bin\sed.exe "s/^hardware version=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^RF band id=/Hardware Revision: /g" | .\data\bin\sed.exe "s/^chip version=/Chip Version: /g" | .\data\bin\sed.exe "s/^MCP info=/MCP Version: /g" | .\data\bin\sed.exe "s/^MCP version=/MCP Version: /g" | .\data\bin\sed.exe "s/^EMMC version=/EMMC Version: /g" | .\data\bin\sed.exe "s/^UFS version=/UFS Version: /g" | .\data\bin\sed.exe "s/none/None/g"
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getBootloaderType 2>&1 | findstr getBootloaderType | .\data\bin\sed.exe "s/getBootloaderType: /Bootloader Type: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Challenge Code ======
echo       ----------------
.\data\fastboot\fastbootfih.exe -s %psn% oem getSecurityVersion 2>&1 | findstr getSecurityVersion | .\data\bin\sed.exe "s/getSecurityVersion: /SecurityVersions: /g"
.\data\fastboot\fastbootfih.exe -s %psn% oem getProjectCode 2>&1 | findstr getProjectCode > %temp%\prjcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\prjcode.txt ) Do set prjcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getBrandCode 2>&1 | findstr getBrandCode > %temp%\brandcode.txt
for /f "tokens=1* delims= " %%A in ( %temp%\brandcode.txt ) Do set brandcode=%%B
.\data\fastboot\fastbootfih.exe -s %psn% oem getUID 2>&1 | findstr getUID > %temp%\uid.txt
for /f "tokens=1* delims= " %%A in ( %temp%\uid.txt ) Do set uid=%%B
del %temp%\brandcode.txt
del %temp%\uid.txt
del %temp%\prjcode.txt
echo Serial Number: %psn%
echo Project Code: %prjcode%
echo Brand Code: %brandcode%
echo UID: %uid%
echo ========================================================
echo Please Calculate above given Challenge Code...
echo.
set Signature=
set /p Signature=Input the Signature code: 
echo %Signature% > %temp%\%psn%_signature_encUID.txt
set Signature=pass
>nul certutil -f -decode %temp%\%psn%_signature_encUID.txt %temp%\encUID.bin
del %temp%\%psn%_signature_encUID.txt
echo.
.\data\fastboot\fastboot.exe -s %psn% flash encUID %temp%\encUID.bin 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem selectKey service 2>nul
.\data\fastboot\fastboot.exe -s %psn% oem doKeyVerify 2>&1 | findstr FAILED > nul
if %errorlevel%==1 set Challenge=Pass
if %errorlevel%==0 set Challenge=fail
if "%Challenge%"=="Pass" goto challengeUIDpass_ROO
if "%Challenge%"=="fail" goto challengeUIDfail_ROO
:allow_ROO
.\data\fastboot\fastboot.exe -s %psn% oem allport 2>nul
.\data\fastboot\fastbootfih.exe -s %psn% oem getRootStatus 2>&1 | findstr getRootStatus | .\data\bin\sed.exe "s/getRootStatus: /Root Status: /g"
echo ========================================================
echo ====== Unlocking Bootloader ======
echo       ----------------------
echo Started bootloader unlocking for %psn% (1/1)...
echo .............................................................
echo Note: Please look at your phone, and proceed the BOOTLOADER UNLOCKING by navigating with
echo       volume key. [if done PRESS ANY KEY... to check device bootloader UNLOCK STATUS]
.\data\fastboot\fastboot.exe -s %psn% erase frp 2>nul
.\data\fastboot\fastboot.exe -s %psn% flashing unlock 2>nul
pause>nul
echo ========================================================
echo ====== Bootloader Status ======
echo       -------------------
.\data\fastboot\fastboot.exe oem alive 2>nul
.\data\fastboot\fastboot.exe -s %psn% getvar unlocked 2>&1 | findstr unlocked | .\data\bin\sed.exe "s/unlocked: /Bootloader Unlocked: /g" | .\data\bin\sed.exe "s/yes/Yes/g" | .\data\bin\sed.exe "s/no/No/g"
echo Device %psn% Rebooting...
.\data\fastboot\fastboot.exe -s %psn% reboot 2>nul
echo.
echo All Done!!
pause
cls
del %temp%\encUID.bin 2>nul
goto strt
:: Commands for Veracity_Approval Nokia 3.1Plus [ROOSTER]
:challengepass_ROO
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allow_ROO
:challengefail_ROO
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
goto ROO
:: Commands for UID_Approval Nokia 3.1Plus [ROOSTER]
:challengeUIDpass_ROO
echo "CORRECT SIGNATURE" : "PERMISSION GRANTED" 
echo ..........................................
goto allowUID_ROO
:challengeUIDfail_ROO
echo "INCORRECT SIGNATURE" : "PERMISSION NOT GRANTED" 
echo ................................................
echo Please retry again, Input the correct Signature.
echo Rebooting bootloader...
.\data\fastboot\fastboot.exe -s %psn% reboot-bootloader 2>nul
timeout /t 6 /nobreak > nul
cls
del %temp%\encUID.bin 2>nul
goto retry_ROO