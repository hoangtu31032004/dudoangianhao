# Hướng dẫn Deploy ứng dụng Streamlit

## Cách 1: Streamlit Cloud (Khuyến nghị - Miễn phí)

### Bước 1: Đẩy code lên GitHub

1. Tạo repository mới trên GitHub
2. Khởi tạo git và đẩy code:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

### Bước 2: Deploy lên Streamlit Cloud

1. Truy cập: https://share.streamlit.io/
2. Đăng nhập bằng GitHub
3. Click "New app"
4. Chọn repository và branch
5. Đặt Main file path: `app.py`
6. Click "Deploy"

Sau khi deploy, bạn sẽ có link dạng: `https://YOUR_APP_NAME.streamlit.app`

---

## Cách 2: Sử dụng ngrok (Nhanh - Tạm thời)

### Bước 1: Cài đặt ngrok

1. Tải ngrok từ: https://ngrok.com/download
2. Giải nén và đặt vào thư mục dễ truy cập

### Bước 2: Chạy ứng dụng

Mở 2 terminal:

**Terminal 1:**
```bash
streamlit run app.py
```

**Terminal 2:**
```bash
ngrok http 8501
```

Ngrok sẽ cung cấp một link công khai dạng: `https://xxxx-xxxx-xxxx.ngrok.io`

**Lưu ý:** Link ngrok sẽ thay đổi mỗi lần chạy (trừ khi dùng tài khoản ngrok có trả phí).

---

## Cách 3: Sử dụng script tự động (ngrok)

Chạy file `run_with_ngrok.py` để tự động khởi động cả Streamlit và ngrok.

