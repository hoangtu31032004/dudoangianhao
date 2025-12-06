# 📝 Hướng dẫn điền form Streamlit Cloud

## ❌ Các lỗi bạn đang gặp:

1. **Branch "master" không tồn tại** → Cần đổi thành **"main"**
2. **File "app.py" không tồn tại** → Cần đảm bảo code đã được push lên GitHub

---

## ✅ CÁCH ĐIỀN ĐÚNG:

### 1. Repository
```
hoangtu31032004/dudoangianhao
```
✅ **Đúng rồi!** Giữ nguyên.

---

### 2. Branch
```
main
```
❌ **Đổi từ "master" thành "main"**

**Lý do:** Repository của bạn đang dùng branch `main`, không phải `master`.

---

### 3. Main file path
```
app.py
```
✅ **Đúng rồi!** Giữ nguyên.

**Nhưng** nếu vẫn báo lỗi "This file does not exist", có nghĩa là:
- Code chưa được push lên GitHub, HOẶC
- File app.py không có trong repository

**Cách kiểm tra:**
1. Truy cập: https://github.com/hoangtu31032004/dudoangianhao
2. Xem có file `app.py` không
3. Nếu không có → Cần push code lên GitHub trước

---

### 4. App URL (optional)
```
dudoangianhao
```
Hoặc để trống để Streamlit tự tạo.

✅ **Có thể giữ nguyên hoặc đổi tên khác**

---

## 🔧 NẾU VẪN BÁO LỖI "app.py does not exist"

### Bước 1: Kiểm tra code đã push chưa

Truy cập: https://github.com/hoangtu31032004/dudoangianhao

**Nếu repository trống hoặc không có file app.py:**
→ Cần push code lên GitHub trước!

### Bước 2: Push code lên GitHub

Mở CMD/PowerShell trong thư mục `D:\dudoangianha` và chạy:

```bash
# Kiểm tra trạng thái
git status

# Nếu chưa có commit
git add .
git commit -m "Initial commit: Ung dung du doan gia nha"
git branch -M main

# Kiểm tra remote
git remote -v

# Nếu chưa có remote hoặc sai URL
git remote remove origin
git remote add origin https://github.com/hoangtu31032004/dudoangianhao.git

# Push code
git push -u origin main
```

### Bước 3: Kiểm tra lại trên GitHub

Sau khi push, refresh trang GitHub và đảm bảo:
- ✅ Có file `app.py`
- ✅ Có file `requirements.txt`
- ✅ Có các file khác

### Bước 4: Quay lại Streamlit Cloud

1. Refresh trang deploy
2. Điền lại:
   - **Branch:** `main` (không phải master)
   - **Main file path:** `app.py`
3. Click **"Deploy"**

---

## 📋 TÓM TẮT CÁCH ĐIỀN:

| Trường | Giá trị |
|--------|---------|
| **Repository** | `hoangtu31032004/dudoangianhao` |
| **Branch** | `main` ⚠️ (KHÔNG phải master) |
| **Main file path** | `app.py` |
| **App URL** | `dudoangianhao` (hoặc để trống) |

---

## ✅ SAU KHI ĐIỀN ĐÚNG:

1. Click nút **"Deploy"**
2. Đợi 1-2 phút để Streamlit cài đặt dependencies
3. Khi xong, bạn sẽ có link: `https://dudoangianhao.streamlit.app`

---

## 🐛 Nếu vẫn lỗi:

1. **Kiểm tra code đã push:**
   - Vào: https://github.com/hoangtu31032004/dudoangianhao
   - Xem có file `app.py` không

2. **Kiểm tra branch:**
   - Trên GitHub, xem branch nào đang active (thường là `main`)

3. **Thử refresh trang Streamlit Cloud**

4. **Xóa app cũ và tạo lại** (nếu đã tạo app trước đó)

