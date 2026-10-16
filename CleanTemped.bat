@echo off
setlocal
title Temporary File Cleanup

rem Restrict cleanup to this Windows user's LocalAppData Temp folder.
if not defined LOCALAPPDATA (
    echo LocalAppData folder was not found.
    timeout /t 2 /nobreak >nul
    exit /b 1
)
set "TEMP_DIR=%LOCALAPPDATA%\Temp"
if not exist "%TEMP_DIR%\" (
    echo User temporary folder was not found.
    timeout /t 2 /nobreak >nul
    exit /b 0
)

echo Cleaning files in:
echo %TEMP_DIR%
del /f /s /q "%TEMP_DIR%\*" >nul 2>nul

echo.
echo Cleanup finished. Files in use were skipped.
echo This only clears temporary files; it does not guarantee higher FPS.
timeout /t 3 /nobreak >nul
exit /b 0