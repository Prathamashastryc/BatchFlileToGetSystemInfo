@echo off
echo Getting System Information...

:: Get CPU Information
echo CPU Information:
wmic cpu get name

:: Get RAM Information
echo.
echo RAM Information:
wmic memorychip get capacity


:: Get Storage Information
echo.
echo Storage Information:
wmic diskdrive get caption,size,model


@echo off
setlocal enabledelayedexpansion

echo List of Drives and their Types:
echo ------------------------------

for /f "tokens=1,2 delims= " %%a in ('wmic logicaldisk get deviceid^,drivetype ^| findstr /r "[0-9]"') do (
    set "drive=%%a"
    set "type=%%b"

    if "!type!"=="2" (
        echo Drive !drive! is a removable drive.
    ) else if "!type!"=="3" (
        echo Drive !drive! is a local hard drive.
    ) else if "!type!"=="4" (
        echo Drive !drive! is a network drive.
    ) else if "!type!"=="5" (
        echo Drive !drive! is a CD/DVD drive.
    ) else if "!type!"=="6" (
        echo Drive !drive! is a RAM disk.
    )
)

::Get Product Key Information
echo.
echo Prouct Key:
wmic path softwarelicensingservice get OA3xOriginalProductKey
echo Information retrieval complete.
pause