@echo off
REM 快速部署脚本 - Windows版
REM 使用方法：deploy.bat "提交信息"

echo [开始部署到GitHub Pages...]
echo.

REM 检查Git是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Git，请先安装Git
    echo 下载地址：https://git-scm.com/download/win
    pause
    exit /b 1
)

REM 添加所有更改
git add .
if errorlevel 1 (
    echo [错误] git add 失败
    pause
    exit /b 1
)
echo [成功] 已添加文件

REM 提交更改
if "%~1"=="" (
    set COMMIT_MSG=更新于 %date% %time%
) else (
    set COMMIT_MSG=%~1
)

git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo [提示] 没有更改需要提交
    pause
    exit /b 0
)
echo [成功] 已提交更改: %COMMIT_MSG%

REM 推送到远程仓库
git push
if errorlevel 1 (
    echo [错误] git push 失败
    echo [提示] 可能需要先关联远程仓库：
    echo git remote add origin https://github.com/你的用户名/snake-dashboard.git
    pause
    exit /b 1
)
echo [成功] 已推送到GitHub

echo.
echo =====================================
echo    🎉 部署成功！
echo    等待1-2分钟后访问网站
echo =====================================
echo.
pause
