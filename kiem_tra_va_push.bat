@echo off
chcp 65001 >nul
echo ========================================
echo   KIEM TRA VA PUSH CODE LEN GITHUB
echo ========================================
echo.

REM Kiểm tra Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [LOI] Git chua duoc cai dat!
    pause
    exit /b 1
)

echo [1] Dang kiem tra trang thai Git...
git status
echo.

echo [2] Dang kiem tra branch hien tai...
git branch
echo.

echo [3] Dang kiem tra remote...
git remote -v
echo.

echo [4] Dang kiem tra commit cuoi cung...
git log --oneline -1
echo.

echo ========================================
echo   KET QUA KIEM TRA
echo ========================================
echo.

REM Kiểm tra xem có file app.py không
if exist "app.py" (
    echo [OK] File app.py ton tai trong thu muc
) else (
    echo [LOI] File app.py KHONG ton tai!
)

echo.
echo ========================================
echo   NEU CAN PUSH CODE:
echo ========================================
echo.
echo Chay cac lenh sau:
echo.
echo git add .
echo git commit -m "Initial commit"
echo git branch -M main
echo git remote add origin https://github.com/hoangtu31032004/dudoangianhao.git
echo git push -u origin main
echo.
echo HOAC chay: fix_and_push.bat
echo.
pause

