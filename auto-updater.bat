@echo off
echo ==============================================
echo Lornet Website Auto-Updater is running!
echo ==============================================
echo Keep this window open. It will automatically detect
echo whenever you save or edit a file and publish the
echo changes to GitHub (every 10 seconds).
echo.

:loop
set "CHANGES="
:: Check if there are any changes (modified, deleted, or new files)
for /f "delims=" %%i in ('git status --porcelain') do set "CHANGES=%%i"

if defined CHANGES (
    echo [ %time% ] Changes detected! Publishing to GitHub...
    git add . > nul 2>&1
    git commit -m "Auto-published website updates" > nul 2>&1
    git push origin main > nul 2>&1
    echo [ %time% ] Successfully published to GitHub!
    echo.
)

:: Wait 10 seconds before checking again
timeout /t 10 /nobreak > nul
goto loop
