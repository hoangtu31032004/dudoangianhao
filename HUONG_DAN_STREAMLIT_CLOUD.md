# 🚀 Hướng dẫn Deploy lên Streamlit Cloud

## BƯỚC 1: Cài đặt Git

1. **Tải Git cho Windows:**
   - Truy cập: https://git-scm.com/download/win
   - Tải và cài đặt (giữ nguyên các tùy chọn mặc định)

2. **Kiểm tra cài đặt:**
   - Mở PowerShell hoặc CMD mới
   - Chạy lệnh: `git --version`
   - Nếu hiển thị version thì đã cài thành công

---

## BƯỚC 2: Tạo tài khoản GitHub

1. **Nếu chưa có tài khoản:**
   - Truy cập: https://github.com/signup
   - Đăng ký tài khoản miễn phí

2. **Nếu đã có tài khoản:**
   - Đăng nhập tại: https://github.com/login

---

## BƯỚC 3: Tạo Repository trên GitHub

1. **Tạo repository mới:**
   - Truy cập: https://github.com/new
   - Điền thông tin:
     - **Repository name:** `dudoangianha` (hoặc tên bạn muốn)
     - **Description:** "Ứng dụng dự đoán giá nhà"
     - **Visibility:** Chọn **Public** (cần thiết cho Streamlit Cloud miễn phí)
   - **KHÔNG** tích vào "Initialize this repository with a README"
   - Click **"Create repository"**

2. **Lưu lại URL repository:**
   - Sẽ có dạng: `https://github.com/TEN_USER/dudoangianha.git`
   - Copy URL này để dùng ở bước sau

---

## BƯỚC 4: Đẩy code lên GitHub

Mở PowerShell hoặc CMD trong thư mục dự án (`D:\dudoangianha`) và chạy các lệnh sau:

```bash
# 1. Khởi tạo git
git init

# 2. Thêm tất cả file vào git
git add .

# 3. Tạo commit đầu tiên
git commit -m "Initial commit: Ứng dụng dự đoán giá nhà"

# 4. Đổi tên branch thành main
git branch -M main

# 5. Kết nối với repository GitHub (THAY TEN_USER và TEN_REPO)
git remote add origin https://github.com/TEN_USER/TEN_REPO.git

# 6. Đẩy code lên GitHub
git push -u origin main
```

**Lưu ý:** 
- Lần đầu push sẽ yêu cầu đăng nhập GitHub
- Có thể cần tạo Personal Access Token thay vì mật khẩu

---

## BƯỚC 5: Tạo Personal Access Token (nếu cần)

Nếu Git yêu cầu token thay vì mật khẩu:

1. Truy cập: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. Đặt tên: `Streamlit Deploy`
4. Chọn quyền: **repo** (tích vào ô "repo")
5. Click **"Generate token"**
6. **Copy token ngay** (sẽ không hiển thị lại)
7. Dùng token này thay cho mật khẩu khi push code

---

## BƯỚC 6: Deploy lên Streamlit Cloud

1. **Truy cập Streamlit Cloud:**
   - Vào: https://share.streamlit.io/
   - Click **"Sign in"** và đăng nhập bằng GitHub

2. **Tạo app mới:**
   - Click nút **"New app"**
   - Điền thông tin:
     - **Repository:** Chọn repository vừa tạo
     - **Branch:** `main`
     - **Main file path:** `app.py`
     - **App URL (tùy chọn):** Đặt tên cho app (ví dụ: `dudoangianha`)
   - Click **"Deploy"**

3. **Đợi deploy:**
   - Streamlit sẽ tự động cài đặt dependencies từ `requirements.txt`
   - Quá trình mất khoảng 1-2 phút
   - Khi xong, bạn sẽ thấy link: `https://TEN_APP.streamlit.app`

---

## BƯỚC 7: Chia sẻ link

Sau khi deploy thành công, bạn sẽ có link công khai dạng:
```
https://dudoangianha.streamlit.app
```

**Link này:**
- ✅ Hoạt động 24/7
- ✅ Ai cũng truy cập được
- ✅ Không cần máy tính của bạn bật
- ✅ Tự động cập nhật khi bạn push code mới lên GitHub

---

## 🔄 Cập nhật ứng dụng sau này

Khi bạn chỉnh sửa code và muốn cập nhật trên Streamlit Cloud:

```bash
git add .
git commit -m "Mô tả thay đổi"
git push
```

Streamlit Cloud sẽ tự động deploy lại trong vài phút!

---

## ❓ Xử lý lỗi thường gặp

### Lỗi: "git is not recognized"
→ Cài đặt Git từ https://git-scm.com/download/win

### Lỗi: "Authentication failed"
→ Tạo Personal Access Token và dùng token thay mật khẩu

### Lỗi: "Repository not found"
→ Kiểm tra lại tên repository và đảm bảo repository là Public

### Lỗi khi deploy: "Module not found"
→ Kiểm tra file `requirements.txt` có đầy đủ dependencies

---

## 📞 Cần giúp đỡ?

- Streamlit Cloud Docs: https://docs.streamlit.io/streamlit-community-cloud
- GitHub Help: https://docs.github.com

