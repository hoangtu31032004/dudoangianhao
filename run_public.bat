@echo off
echo ========================================
echo   KHOI DONG UNG DUNG DU DOAN GIA NHA
echo ========================================
echo.

REM Kiểm tra xem ngrok có tồn tại không
where ngrok >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Khong tim thay ngrok!
    echo.
    echo Vui long:
    echo 1. Tai ngrok tu: https://ngrok.com/download
    echo 2. Giai nen va dat vao thu muc nay
    echo 3. Hoac them ngrok vao PATH
    echo.
    pause
    exit /b 1
)

echo [1/2] Dang khoi dong Streamlit...
start "Streamlit" cmd /k "streamlit run app.py"

timeout /t 5 /nobreak >nul

echo [2/2] Dang khoi dong ngrok...
start "Ngrok" cmd /k "ngrok http 8501"

echo.
echo ========================================
echo   KHOI DONG THANH CONG!
echo ========================================
echo.
echo Streamlit: http://localhost:8501
echo Ngrok Web UI: http://127.0.0.1:4040
echo.
echo Link cong khai se hien thi trong cua so Ngrok
echo.
echo Nhan phim bat ky de dong...
pause >nul

