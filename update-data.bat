@echo off
chcp 65001 > nul
echo ================================
echo   蛇货战绩数据大屏 - 快速更新
echo ================================
echo.

REM 检查是否提供了提交信息
if "%~1"=="" (
    set /p MSG=请输入更新说明（例如：更新数据到10月21日）:
) else (
    set MSG=%~1
)

echo.
echo [1/4] 添加更改到Git...
git add data.json

echo [2/4] 提交更改...
git commit -m "%MSG%"

echo [3/4] 推送到GitHub main分支...
git push

echo [4/4] 同步到GitHub Pages...
git push origin main:gh-pages --force

echo.
echo ================================
echo   ✅ 更新完成！
echo ================================
echo.
echo 请等待1-2分钟，然后访问：
echo GitHub Pages: https://xujinjie666.github.io/snake-dashboard/
echo Vercel: https://snake-dashboard-dun.vercel.app/
echo.
pause
