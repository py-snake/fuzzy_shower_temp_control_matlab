@echo off
title Git Uploader
color 0A

:: Get the directory where the script is located
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo ==============================================
echo  Git Uploader - Uploading Changes to GitHub
echo ==============================================
echo.

:: Check if current directory is a git repo
echo [INFO] Current directory: %CD%
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Current directory is not a Git repository
    pause
    exit /b 1
)
echo.

:: Check Git status
echo [STATUS] Checking repository status...
git status
if %errorlevel% neq 0 (
    echo [ERROR] Failed to check Git status
    pause
    exit /b 1
)
echo.

:: Stage all changes
echo [STAGING] Adding all changes to the staging area...
git add .
if %errorlevel% neq 0 (
    echo [ERROR] Failed to stage changes
    pause
    exit /b 1
)
echo [SUCCESS] All changes staged successfully!
echo.

:: Commit changes
echo [COMMIT] Committing changes with message "upload"...
git commit -m "upload"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to commit changes
    pause
    exit /b 1
)
echo [SUCCESS] Changes committed successfully!
echo.

:: Push changes to remote
echo [PUSH] Pushing changes to origin/main...
git push origin main
if %errorlevel% neq 0 (
    echo [ERROR] Failed to push changes
    pause
    exit /b 1
)
echo [SUCCESS] Changes pushed to GitHub successfully!
echo.

:: Final status check
echo [STATUS] Checking final repository status...
git status
if %errorlevel% neq 0 (
    echo [ERROR] Failed to check final Git status
    pause
    exit /b 1
)
echo.

echo ==============================================
echo  Git Uploader - Upload Complete!
echo ==============================================
pause