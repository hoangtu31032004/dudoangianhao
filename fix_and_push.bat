@echo off
chcp 65001 >nul
echo ========================================
echo   SUA LOI VA DAY CODE LEN GITHUB
echo ========================================
echo.

REM Kiểm tra Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [LOI] Git chua duoc cai dat!
    echo Vui long cai dat Git tu: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/7] Dang kiem tra cau hinh Git...
git config --global user.name >nul 2>nul
if %errorlevel% neq 0 (
    echo [CANH BAO] Chua cau hinh Git user.name
    echo Vui long nhap ten cua ban:
    set /p GIT_NAME="Ten: "
    git config --global user.name "%GIT_NAME%"
)

git config --global user.email >nul 2>nul
if %errorlevel% neq 0 (
    echo [CANH BAO] Chua cau hinh Git user.email
    echo Vui long nhap email cua ban:
    set /p GIT_EMAIL="Email: "
    git config --global user.email "%GIT_EMAIL%"
)

echo [OK] Git da duoc cau hinh
echo.

REM Kiểm tra xem đã có .git chưa
if not exist ".git" (
    echo [2/7] Dang khoi tao Git repository...
    git init
    echo [OK] Da khoi tao Git repository
) else (
    echo [OK] Git repository da ton tai
)
echo.

REM Thêm file
echo [3/7] Dang them cac file vao Git...
git add .
if %errorlevel% neq 0 (
    echo [LOI] Khong the them file!
    pause
    exit /b 1
)
echo [OK] Da them file
echo.

REM Kiểm tra xem đã có commit chưa
git log --oneline -1 >nul 2>nul
if %errorlevel% neq 0 (
    echo [4/7] Dang tao commit...
    git commit -m "Initial commit: Ung dung du doan gia nha"
    if %errorlevel% neq 0 (
        echo [LOI] Khong the tao commit! Co the chua co file nao de commit.
        pause
        exit /b 1
    )
    echo [OK] Da tao commit
) else (
    echo [OK] Da co commit truoc do
)
echo.

REM Đổi tên branch
echo [5/7] Dang doi ten branch thanh main...
git branch -M main
echo [OK] Da doi ten branch
echo.

REM Kiểm tra remote
echo [6/7] Dang kiem tra remote...
git remote get-url origin >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Remote origin da ton tai
    git remote -v
    echo.
    echo Ban co muon thay doi remote khong? (y/n)
    set /p CHANGE_REMOTE="> "
    if /i "%CHANGE_REMOTE%"=="y" (
        git remote remove origin
        echo Vui long nhap URL repository GitHub:
        set /p REPO_URL="URL: "
        git remote add origin %REPO_URL%
        echo [OK] Da cap nhat remote
    )
) else (
    echo [CANH BAO] Chua co remote origin
    echo Vui long nhap URL repository GitHub:
    set /p REPO_URL="URL: "
    git remote add origin %REPO_URL%
    echo [OK] Da them remote
)
echo.

REM Push
echo [7/7] Dang day code len GitHub...
echo.
git push -u origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   THANH CONG! Code da duoc day len GitHub
    echo ========================================
) else (
    echo.
    echo ========================================
    echo   LOI KHI PUSH
    echo ========================================
    echo.
    echo Co the do:
    echo 1. Chua dang nhap GitHub
    echo 2. Can Personal Access Token
    echo 3. Repository khong ton tai hoac khong co quyen
    echo.
    echo Huong dan tao Personal Access Token:
    echo https://github.com/settings/tokens
    echo.
)

echo.
pause

