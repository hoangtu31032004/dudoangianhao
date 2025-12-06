# 🔧 Giải quyết lỗi "This branch does not exist"

## ❌ Vấn đề:
Streamlit Cloud báo lỗi: **"This branch does not exist"**

## 🔍 Nguyên nhân:
Branch `main` chưa được tạo trên GitHub vì code chưa được push lên.

---

## ✅ GIẢI PHÁP: Push code lên GitHub

### Cách 1: Dùng script tự động (Dễ nhất)

**Chạy file:** `fix_and_push.bat`

Script sẽ tự động:
- ✅ Cấu hình Git (nếu cần)
- ✅ Tạo commit
- ✅ Đổi tên branch thành main
- ✅ Push code lên GitHub

---

### Cách 2: Chạy thủ công từng lệnh

Mở **CMD** hoặc **PowerShell** trong thư mục `D:\dudoangianha` và chạy:

#### Bước 1: Cấu hình Git (chỉ cần làm 1 lần)

```bash
git config --global user.name "Hoang Tu"
git config --global user.email "hoangtu31032004@gmail.com"
```

#### Bước 2: Kiểm tra trạng thái

```bash
git status
```

#### Bước 3: Thêm file và tạo commit

```bash
git add .
git commit -m "Initial commit: Ung dung du doan gia nha"
```

#### Bước 4: Đổi tên branch thành main

```bash
git branch -M main
```

#### Bước 5: Kiểm tra remote

```bash
git remote -v
```

**Nếu chưa có remote hoặc sai URL:**

```bash
git remote remove origin
git remote add origin https://github.com/hoangtu31032004/dudoangianhao.git
```

#### Bước 6: Push code lên GitHub

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
4. Chọn quyền: Tích vào **"repo"** (tất cả quyền)
5. Click **"Generate token"**
6. **Copy token ngay** (sẽ không hiển thị lại!)
7. Khi push, dùng:
   - **Username:** Tên GitHub của bạn
   - **Password:** Dán token vừa copy

---

## ✅ Kiểm tra kết quả

Sau khi push thành công:

1. **Truy cập GitHub:**
   ```
   https://github.com/hoangtu31032004/dudoangianhao
   ```

2. **Kiểm tra:**
   - ✅ Có file `app.py`
   - ✅ Có file `requirements.txt`
   - ✅ Có branch `main` (xem ở góc trên bên trái)

3. **Quay lại Streamlit Cloud:**
   - Refresh trang deploy
   - Branch sẽ tự động nhận diện `main`
   - Click **"Deploy"**

---

## 📋 TÓM TẮT TẤT CẢ LỆNH (Copy/paste)

```bash
# 1. Cấu hình Git (chỉ 1 lần)
git config --global user.name "Hoang Tu"
git config --global user.email "hoangtu31032004@gmail.com"

# 2. Thêm file và commit
git add .
git commit -m "Initial commit: Ung dung du doan gia nha"

# 3. Đổi tên branch
git branch -M main

# 4. Thêm remote (nếu chưa có)
git remote remove origin
git remote add origin https://github.com/hoangtu31032004/dudoangianhao.git

# 5. Push code
git push -u origin main
```

---

## 🐛 Xử lý lỗi thường gặp

### Lỗi: "git is not recognized"
→ Cài đặt Git: https://git-scm.com/download/win

### Lỗi: "Authentication failed"
→ Tạo Personal Access Token và dùng token thay mật khẩu

### Lỗi: "Repository not found"
→ Kiểm tra URL repository và đảm bảo repository là **Public**

### Lỗi: "remote origin already exists"
→ Chạy: `git remote remove origin` rồi thêm lại

---

## 🎯 Sau khi push thành công

1. ✅ Code đã có trên GitHub
2. ✅ Branch `main` đã được tạo
3. ✅ Quay lại Streamlit Cloud và deploy lại
4. ✅ Lỗi "This branch does not exist" sẽ biến mất!

