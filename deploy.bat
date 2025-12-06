@echo off
chcp 65001 >nul
echo ═══════════════════════════════════════════════════════════
echo   HƯỚNG DẪN DEPLOY LÊN STREAMLIT CLOUD
echo ═══════════════════════════════════════════════════════════
echo.

REM Kiểm tra Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [❌] Git chưa được cài đặt!
    echo.
    echo 📥 Vui lòng cài đặt Git trước:
    echo    1. Truy cập: https://git-scm.com/download/win
    echo    2. Tải và cài đặt Git
    echo    3. Mở lại PowerShell/CMD và chạy lại script này
    echo.
    pause
    exit /b 1
)

echo [✅] Git đã được cài đặt
echo.

REM Kiểm tra xem đã có git init chưa
if not exist ".git" (
    echo [1/6] Đang khởi tạo Git repository...
    git init
    if %errorlevel% neq 0 (
        echo [❌] Lỗi khi khởi tạo Git!
        pause
        exit /b 1
    )
    echo [✅] Đã khởi tạo Git repository
) else (
    echo [ℹ️] Git repository đã tồn tại
)
echo.

echo [2/6] Đang thêm các file vào Git...
git add .
if %errorlevel% neq 0 (
    echo [❌] Lỗi khi thêm file!
    pause
    exit /b 1
)
echo [✅] Đã thêm file
echo.

echo [3/6] Đang tạo commit...
git commit -m "Initial commit: Ứng dụng dự đoán giá nhà"
if %errorlevel% neq 0 (
    echo [⚠️] Có thể đã có commit trước đó, tiếp tục...
)
echo.

echo [4/6] Đang đổi tên branch thành main...
git branch -M main
echo [✅] Đã đổi tên branch
echo.

echo ═══════════════════════════════════════════════════════════
echo   BƯỚC TIẾP THEO (THỦ CÔNG):
echo ═══════════════════════════════════════════════════════════
echo.
echo 1. Tạo repository trên GitHub:
echo    - Truy cập: https://github.com/new
echo    - Đặt tên repository (ví dụ: dudoangianha)
echo    - Chọn Public
echo    - KHÔNG tích "Initialize with README"
echo    - Click "Create repository"
echo.
echo 2. Copy URL repository (dạng: https://github.com/USER/REPO.git)
echo.
echo 3. Chạy các lệnh sau (THAY URL bằng URL của bạn):
echo.
echo    git remote add origin https://github.com/USER/REPO.git
echo    git push -u origin main
echo.
echo 4. Sau khi push thành công, truy cập:
echo    https://share.streamlit.io/
echo    và deploy app!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause

