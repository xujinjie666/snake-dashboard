@echo off
echo ================================
echo   Data Update Script
echo ================================
echo.

if "%~1"=="" (
    set MSG=update data
) else (
    set MSG=%~1
)

echo [1/4] Adding changes...
git add data.json

echo [2/4] Committing...
git commit -m "%MSG%"

echo [3/4] Pushing to GitHub main...
git push

echo [4/4] Syncing to GitHub Pages...
git push origin main:gh-pages --force

echo.
echo ================================
echo   Done!
echo ================================
echo.
echo Wait 1-2 minutes, then visit:
echo GitHub Pages: https://xujinjie666.github.io/snake-dashboard/
echo Vercel: https://snake-dashboard-dun.vercel.app/
echo.
pause
