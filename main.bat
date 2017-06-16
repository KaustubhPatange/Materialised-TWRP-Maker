@echo off
cd "%~dp0"
:main
set recboot=None
set returntome=
cd "%~dp0"
cls
call :loop
:loop2
echo      ********************************************************************
tools\cecho.exe      * {0a}a. Automatically Make a Materialised TWRP for MTK/QUALCOM Phones {07}*
echo.
echo      ********************************************************************
echo.
echo      ***************************              ***************************
tools\cecho.exe      *{0d} b. Unpack recovery\boot{07} *              *{0e} c. Repack recovery\boot{07} *
echo.
echo      ***************************              ***************************
tools\cecho.exe                                  {0a} i. See Info {07}
echo.
echo      ***************************               **************************
tools\cecho.exe      *{0b} d. Clear all cache/data {07}*               *{0c} e. Exit                {07}*
echo.
echo      ***************************               **************************
echo.
set /p Input=[*] Make a Choice (for eg:- a,b,c,d,e):- 
if %Input%==e exit
if %Input%==E exit
if %Input%==b goto unpack
if %Input%==c goto repack
if %Input%==C goto repack
if %Input%==B goto unpack
if %Input%==d goto cache
if %Input%==D goto cache
if %Input%==a goto automatic
if %Input%==A goto automatic
if %Input%==i goto info
if %Input%==I goto info
echo.
tools\cecho.exe {0c}You definitly went crazy, coz you are typing options that are not really there {07}
echo.
echo.
pause
goto main
:info
cls
echo.
tools\cecho.exe  {0b} Info About Automatic Materialised TWRP Maker Tool {0c}
echo.
echo.
echo  What is recovery and its img?
echo.
tools\cecho.exe {07} In Android, recovery refers to the dedicated, bootable partition that has the 
echo.
echo  recovery console installed. A combination of key presses (or instructions from
echo  a command line) will boot your phone to recovery, where you can find tools to 
echo  help repair (recover) your installation as well as install official OS updates.
echo.
tools\cecho.exe {0c} What is boot and its img?{07}
echo.
echo.
echo  Boot.img contains the kernel and ramdisk, critical files necessary to load the
echo  device before the filesystem can be mounted.
echo.
tools\cecho.exe {0c} What is kernel?{07}
echo.
echo.
echo  A kernel in an Android—is the component responsible for helping your 
echo  applications communicate with your hardware. It manages the system
echo  resources, communicates with external devices when needed, and so on. Android
echo  uses a variation of the Linux kernel. It is like HEART of Android.
echo.
tools\cecho.exe {0c} What is ramdisk img?{07}
echo.
echo.
echo  Ramdisk.img is a small partition image that is mounted read-only by the kernel
echo  at boot time. It only contains /init and a few config files. It is used to 
echo  start init which will mount the rest of the system images properly.
echo.
pause
cls
echo.
tools\cecho.exe  {0b} Info About Automatic Materialised TWRP Maker Tool {0e}
echo.
echo.
echo  How to unpack boot or recovery img?
echo.
tools\cecho.exe {0d} Once you Opened the tool head to option b which says unpack img
echo.
echo  Now drag the boot or recovery img there and press enter a newly upacked
echo  folder will be created.
echo.
tools\cecho.exe {0e} How to repack boot or recovery img?{0d}
echo.
echo.
echo  Once you Opened the tool head to option c which says repack img
echo  Now drag the unpacked folder and press enter, a newly created img will
echo  be generated.
echo.
tools\cecho.exe {0e} How to make a materialised TWRP?{0d}
echo.
echo.
echo  Once you Opened the tool head to option a which says LOL..YOU CAN SEE IT
echo  Now drag the TWRP img of your Phone, then press Enter.
echo  Now you have to enter some of the information about your twrp and phone
echo  Once done..a newly img will be be generated in Projects folder.
echo.
tools\cecho.exe {07}
pause
goto main
:automatic
cls
if exist "%appdata%\TWRP" (rd /s /q "%appdata%\TWRP")
md "%appdata%\TWRP"
call :loop
set error=IMAGE
tools\cecho.exe {0e} 
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
set /p recboot=[*] Drag your Phones TWRP image here : 
if not exist "%recboot%" goto error
copy %recboot% 
set /A count=0
FOR %%F IN (*.img) DO (set /A count+=1 && set tmpstore=%%~nF%%~xF && set jar=0)
if %count%==1 (set capp=%tmpstore%)
ping localhost -n 1 >nul
cd "%~dp0"
if exist %recboot%_new (rd /s /q %recboot%_new)
call :loop
tools\cecho.exe {0b}  Now you have to Give Some of the details..
echo.
echo.
pause
:onceagain 
set res=None
:: COOL A NICE MOVIE NAME,,, REALLY :p
call :loop
tools\cecho.exe {0c}  Give your Phones Resolution for eg :- (1280 x 720, 1280 x 768, etc) {07}
echo.
echo.
echo  1. 720  x 1280
echo  2. 768  x 1280
echo  3. 800  x 1280
echo  4. 1080 x 1920
echo  5. 1200 x 1920
echo  6. 1440 x 2560
echo  7. 1536 x 2048
echo.
tools\cecho.exe {0d}
set /p res=[*] Select your Phone's Resolution : 
if %res% GTR 7 (
echo.
echo.
echo  Don't be silly give a correct Input..
goto onceagain
)
call :loop
tools\cecho.exe {0b}
echo  Give a Ripper Name and Your Name..
echo.
tools\cecho.exe  Ripper name will be set as {0e}Title{0b},,
echo.
echo.
tools\cecho.exe  Your name will be set as {0e}Author name {07}
echo.
echo.
echo.
set /P rip=[*] Ripper Name : 
echo.
set /p author=[*] Your Name : 
:onceagain1
set pq=%~dp0
:: COOL! THIS HAPPENS WHEN YOU OVER WATCH A MOVIE
call :loop
set twrpver=None
tools\cecho.exe {0e} Now you have to select your TWRP version for the recovery you have draged {07}
echo.
echo.
echo  1. TWRP 2.8.6.x
echo  2. TWRP 2.8.7.x
echo  3. TWRP 3.0.2.x
echo  4. TWRP 3.0.2.2
echo  5. TWRP 3.0.3.x
echo  6. TWRP 3.1.0.x
echo.
tools\cecho.exe {0d}
set /p twrpver=[*] Select your TWRP version : 
if %twrpver% GTR 6 (
echo.
echo.
echo  What MAN!.. Make Proper Selection
goto onceagain1
)
:onceagain12
::SORRY NO COMMENTS PLEASE xD
call :loop
tools\cecho.exe {0c}  Now you have to select whether your device supports bootloader
echo.
tools\cecho.exe {0c}  or Download mode{07}
echo.
echo.
echo  1. Based on Samsung's Download Mode
echo  2. Based on Normal Bootloader Mode
echo.
tools\cecho.exe {0d}
set /p devicetype=[*] Select your Device type : 
if %devicetype% GTR 2 (
echo.
echo.
echo  Don't be silly give a correct Input..
goto onceagain12
)
call :loop
tools\cecho.exe {0e}  Give a Contact site, where people can contact you,, {0d}
echo.
echo.
echo  If you don't have Press "x"
tools\cecho.exe {07}
echo.
set /p contact-info=[*] Give your contact web : 
cls
call :loop
tools\cecho.exe {0a}  Now you have to give credits for your work! Total 3 {0e}
echo.
echo  Credits must be short and contains less words 
echo  for eg: to "someone" who did this and that 
tools\cecho.exe {07}
echo.
echo.
set /p credit1=[*] Fill Credit 1 : 
echo.
set /p credit2=[*] Fill Credit 2 : 
echo. 
echo [*] Fill Credit 3 : WILL BE SET DEFAULT
echo.
ping localhost -n 3 >nul
:onceagain3
set GO=None
:: NO DISCUSSION ABOUT THIS :P :D..LOL HAHA
call :loop
echo.
tools\cecho.exe {0c}  You are done now,,, Press "{0e}Y{0c}" to make and "{0e}N{0c}" to cancel {07}
echo.
echo.
set /p GO=[*] Press Y for YES and N for No : 
if %GO%==Y goto startyourwork
if %GO%==N goto main
cls
echo Type a Real Option,,
echo.
pause
goto onceagain3
:startyourwork
echo.
tools\cecho.exe {0a}
md %recboot%_new
cd %recboot%_new
echo  Unpacking Image Now...
"%~dp0Scripts\unpackimg.exe" %recboot%
echo.
echo.
:startyourwork1
cd "%~dp0"
if not exist ramdisk\twres (
echo.
tools\cecho.exe {0c} * The Image you have selected is not TWRP image.
echo.
echo.
tools\cecho.exe {0b} * Please make a valid Selection. {0a}
echo.
echo.
if exist split_img (rd /s /q split_img)
if exist ramdisk (rd /s /q ramdisk)
if exist %recboot%_new (rd /s /q %recboot%_new)
pause
goto main
)
call Scripts\res.exe
echo.
ping localhost -n 1 >nul
cd "%~dp0"
call Scripts\repackimg.exe 
echo.
if exist TWRP.materialised.img (del TWRP-materialised.img /Q)
ren image-new.img TWRP-materialised.img
move TWRP-materialised.img Projects
echo Deleting tmp dirs,files..
for /f "delims=" %%a in ('dir /b split_img\*-ramdiskcomp') do @set ramdiskcname=%%a
for /f "delims=" %%a in ('type "split_img\%ramdiskcname%"') do @set ramdiskcomp=%%a
if "%ramdiskcomp%" == "gzip" set "repackcmd=gzip %level%" & set "compext=gz"
if "%ramdiskcomp%" == "lzop" set "repackcmd=lzop %level%" & set "compext=lzo"
if "%ramdiskcomp%" == "lzma" set "repackcmd=xz -Flzma %level%" & set "compext=lzma"
if "%ramdiskcomp%" == "xz" set "repackcmd=xz %level% -Ccrc32" & set "compext=xz"
if "%ramdiskcomp%" == "bzip2" set "repackcmd=bzip2 %level%" & set "compext=bz2"
if "%ramdiskcomp%" == "lz4" set "repackcmd=lz4 %level% -l" & set "compext=lz4
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
if exist *.mtk (del /q *.mtk)
if exist *.img (del /q *.img)
if exist ramdisk-new.cpio.%compext% (del ramdisk-new.cpio.%compext% /Q)
echo.
tools\cecho.exe  {0d}Target Saved at %~dp0Projects\TWRP-materialised.img{07}
echo.
echo.
if %twrpver%==5 (echo Your recovery may be unstable while flashing.. && echo.)
pause
goto main
:cache
echo.
tools\cecho.exe {0a}
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
if exist %unrecboot% (echo  Folder Found !) else (goto done)
cd %unrecboot%
for /f "delims=" %%a in ('dir /b split_img\*-ramdiskcomp') do @set ramdiskcname=%%a
for /f "delims=" %%a in ('type "split_img\%ramdiskcname%"') do @set ramdiskcomp=%%a
if "%ramdiskcomp%" == "gzip" set "repackcmd=gzip %level%" & set "compext=gz"
if "%ramdiskcomp%" == "lzop" set "repackcmd=lzop %level%" & set "compext=lzo"
if "%ramdiskcomp%" == "lzma" set "repackcmd=xz -Flzma %level%" & set "compext=lzma"
if "%ramdiskcomp%" == "xz" set "repackcmd=xz %level% -Ccrc32" & set "compext=xz"
if "%ramdiskcomp%" == "bzip2" set "repackcmd=bzip2 %level%" & set "compext=bz2"
if "%ramdiskcomp%" == "lz4" set "repackcmd=lz4 %level% -l" & set "compext=lz4"
if exist "ramdisk" (rd /s /q "ramdisk")
if exist "split_img" (rd /s /q "split_img")
cd "%~dp0"
echo.
echo  Deleting everything except that Image !
if exist %capp%_new (rd /s /q %capp%_new /Q)
:done
if exist ramdisk-new.cpio.%compext% (del ramdisk-new.cpio.%compext% /Q)
if exist kernel-new.mtk (del kernel-new.mtk /Q)
if exist recovery-new.mtk (del recovery-new.mtk /Q)
echo.
echo  Done!
echo.
pause
goto main
:repack
set unrecboot=None
cd "%~dp0"
cls
call :loop
set error=FOLDER
echo  You have to drag the folder which you have unpacked before, contains 
tools\cecho.exe {0e}  "ramdisk"{07} and{0e} "split_img"{07} folders.
echo.
echo.
tools\cecho.exe {0d} 
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
set /p unrecboot=[*] Drag your unpacked recovery or boot folder : 
echo.
if not exist %unrecboot% goto error
cd %unrecboot%
for /f "delims=" %%a in ('dir /b split_img\*-ramdiskcomp') do @set ramdiskcname=%%a
for /f "delims=" %%a in ('type "split_img\%ramdiskcname%"') do @set ramdiskcomp=%%a
if "%ramdiskcomp%" == "gzip" set "repackcmd=gzip %level%" & set "compext=gz"
if "%ramdiskcomp%" == "lzop" set "repackcmd=lzop %level%" & set "compext=lzo"
if "%ramdiskcomp%" == "lzma" set "repackcmd=xz -Flzma %level%" & set "compext=lzma"
if "%ramdiskcomp%" == "xz" set "repackcmd=xz %level% -Ccrc32" & set "compext=xz"
if "%ramdiskcomp%" == "bzip2" set "repackcmd=bzip2 %level%" & set "compext=bz2"
if "%ramdiskcomp%" == "lz4" set "repackcmd=lz4 %level% -l" & set "compext=lz4"
cd "%~dp0"
tools\cecho.exe {0a}
echo  Repacking Image Now..
echo.
xcopy %unrecboot%\* /e
call Scripts\repackimg.exe 
echo.
echo  Deleting temp files..
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
del ramdisk-new.cpio.%compext% /Q
move image-new.img %unrecboot%
echo.
"%~dp0tools\cecho.exe" {0e} Target Saved at %unrecboot%\image-new.img {07}
echo.
echo.
goto done
:unpack
cd "%~dp0"
cls
call :loop
set error=IMAGE
tools\cecho.exe {0e} 
if exist ramdisk (rd /s /q ramdisk)
if exist split_img (rd /s /q split_img)
set /p recboot=[*] Drag your recovery or boot image : 
if not exist %recboot% goto error
if exist %recboot%_new (rd /s /q %recboot%_new)
echo.
:unpack1
tools\cecho.exe {0a}
md %recboot%_new
cd %recboot%_new
echo  Unpacking Image Now...
"%~dp0Scripts\unpackimg.exe" %recboot%
move "%~dp0ramdisk"
move "%~dp0split_img"
echo.
%returntome%
"%~dp0tools\cecho.exe" {0d} Target Saved at %recboot%_new {07}
echo.
echo.
pause
goto main
:error
cd "%~dp0"
echo.
tools\cecho.exe {0c} WRONG %error% !
echo.
echo.
pause
goto main
:loop
cd "%~dp0"
set Input=Garbage
mode 80,30
color 07
cls
echo.
echo *******************************************************************************
echo *                                                                             *
tools\cecho.exe * {0b}             "Automatic Materialised TWRP Maker v1.0.2"
tools\cecho.exe {07}                     *
echo.
tools\cecho.exe *                recovery+materialised twrp themed by{0b} KP@2016
tools\cecho.exe {07}                 *
echo.
tools\cecho.exe *           including support for{0e} MTK/QUALCOM powered{07} phones images
tools\cecho.exe {07}           *
echo.
echo *                                                                             *
tools\cecho.exe * {0c} Note:- This will create a materialised twrp image for almost any mtk and  {07} * * {0c} qualcom supported device, by using my own customized themes  {07}              *
echo.
echo *                                                                             *
echo * I may not responsible for any damage cause by this tool, if you blame at me *
echo * I will ranaway.You can also Unpack and Repack recovery\boot images easily :)*
echo *                                                                             *
echo *******************************************************************************
echo.
echo.