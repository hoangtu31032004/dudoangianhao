"""
Script để chạy Streamlit app với ngrok tự động
Yêu cầu: Cài đặt ngrok và thêm vào PATH
"""
import subprocess
import time
import sys
import os

def find_ngrok():
    """Tìm đường dẫn ngrok"""
    # Kiểm tra trong PATH
    if os.system("where ngrok >nul 2>nul") == 0:
        return "ngrok"
    
    # Kiểm tra các vị trí thường gặp trên Windows
    common_paths = [
        r"C:\ngrok\ngrok.exe",
        r"C:\Program Files\ngrok\ngrok.exe",
        r"C:\Users\{}\AppData\Local\ngrok\ngrok.exe".format(os.getenv('USERNAME')),
    ]
    
    for path in common_paths:
        if os.path.exists(path):
            return path
    
    return None

def main():
    print("🚀 Đang khởi động ứng dụng...")
    
    # Tìm ngrok
    ngrok_path = find_ngrok()
    if not ngrok_path:
        print("❌ Không tìm thấy ngrok!")
        print("📥 Vui lòng tải ngrok từ: https://ngrok.com/download")
        print("📁 Giải nén và thêm vào PATH hoặc đặt trong thư mục hiện tại")
        sys.exit(1)
    
    # Khởi động Streamlit trong background
    print("📱 Đang khởi động Streamlit...")
    streamlit_process = subprocess.Popen(
        [sys.executable, "-m", "streamlit", "run", "app.py"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    
    # Đợi Streamlit khởi động
    time.sleep(3)
    
    # Khởi động ngrok
    print("🌐 Đang khởi động ngrok...")
    ngrok_process = subprocess.Popen(
        [ngrok_path, "http", "8501"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    
    print("\n✅ Ứng dụng đã khởi động!")
    print("📍 Streamlit: http://localhost:8501")
    print("🌍 Ngrok: Kiểm tra link công khai tại http://127.0.0.1:4040")
    print("\n⚠️  Nhấn Ctrl+C để dừng ứng dụng")
    
    try:
        # Giữ script chạy
        streamlit_process.wait()
    except KeyboardInterrupt:
        print("\n🛑 Đang dừng ứng dụng...")
        streamlit_process.terminate()
        ngrok_process.terminate()
        print("✅ Đã dừng!")

if __name__ == "__main__":
    main()

