# 📝 Hướng dẫn chi tiết BƯỚC 4: Đẩy code lên GitHub

## ⚠️ YÊU CẦU TRƯỚC KHI BẮT ĐẦU

1. ✅ **Đã cài đặt Git** (nếu chưa: https://git-scm.com/download/win)
2. ✅ **Đã tạo tài khoản GitHub** (nếu chưa: https://github.com/signup)
3. ✅ **Đã tạo repository trên GitHub** (nếu chưa: https://github.com/new)

---

## 🚀 CÁCH 1: Chạy script tự động (Dễ nhất)

### Bước 1: Cài Git (nếu chưa có)
1. Tải Git: https://git-scm.com/download/win
2. Cài đặt (giữ nguyên tùy chọn mặc định)
3. **Khởi động lại PowerShell/CMD** sau khi cài

### Bước 2: Chạy script
Mở PowerShell trong thư mục `D:\dudoangianha` và chạy:
```powershell
powershell -ExecutionPolicy Bypass -File push_to_github.ps1
```

Script sẽ tự động:
- ✅ Khởi tạo Git repository
- ✅ Thêm tất cả file
- ✅ Tạo commit
- ✅ Đổi tên branch thành main

Sau đó bạn chỉ cần làm bước 3 và 4 bên dưới.

---

## 🛠️ CÁCH 2: Chạy thủ công từng lệnh

Mở **PowerShell** hoặc **CMD** trong thư mục `D:\dudoangianha` và chạy từng lệnh sau:

### Bước 1: Khởi tạo Git
```bash
git init
```

### Bước 2: Thêm tất cả file
```bash
git add .
```

### Bước 3: Tạo commit
```bash
git commit -m "Initial commit: Ung dung du doan gia nha"
```

### Bước 4: Đổi tên branch thành main
```bash
git branch -M main
```

### Bước 5: Kết nối với GitHub repository

**Trước tiên, bạn cần tạo repository trên GitHub:**
1. Truy cập: https://github.com/new
2. Đặt tên repository (ví dụ: `dudoangianha`)
3. Chọn **Public**
4. **KHÔNG** tích "Initialize this repository with a README"
5. Click **"Create repository"**

**Sau đó, copy URL repository** (sẽ có dạng: `https://github.com/TEN_USER/TEN_REPO.git`)

**Chạy lệnh sau (THAY URL bằng URL của bạn):**
```bash
git remote add origin https://github.com/TEN_USER/TEN_REPO.git
```

**Ví dụ:**
```bash
git remote add origin https://github.com/nguyenvana/dudoangianha.git
```

### Bước 6: Đẩy code lên GitHub
```bash
git push -u origin main
```

**Lưu ý:** 
- Lần đầu sẽ yêu cầu đăng nhập GitHub
- Có thể cần dùng **Personal Access Token** thay vì mật khẩu

---

## 🔑 Tạo Personal Access Token (nếu cần)

Nếu Git yêu cầu token:

1. Truy cập: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. Đặt tên: `Streamlit Deploy`
4. Chọn quyền: Tích vào **"repo"** (tất cả quyền trong repo)
5. Click **"Generate token"**
6. **Copy token ngay** (sẽ không hiển thị lại!)
7. Dùng token này thay cho mật khẩu khi push

---

## ✅ Kiểm tra kết quả

Sau khi push thành công, truy cập repository trên GitHub:
```
https://github.com/TEN_USER/TEN_REPO
```

Bạn sẽ thấy tất cả các file đã được upload!

---

## 🐛 Xử lý lỗi thường gặp

### Lỗi: "git is not recognized"
→ Cài đặt Git và khởi động lại terminal

### Lỗi: "remote origin already exists"
→ Chạy: `git remote remove origin` rồi chạy lại lệnh `git remote add origin`

### Lỗi: "Authentication failed"
→ Tạo Personal Access Token và dùng token thay mật khẩu

### Lỗi: "Repository not found"
→ Kiểm tra lại URL repository và đảm bảo repository là Public

---

## 📋 Tóm tắt các lệnh (copy/paste)

```bash
git init
git add .
git commit -m "Initial commit: Ung dung du doan gia nha"
git branch -M main
git remote add origin https://github.com/TEN_USER/TEN_REPO.git
git push -u origin main
```

**Nhớ thay `TEN_USER` và `TEN_REPO` bằng thông tin thực tế của bạn!**

