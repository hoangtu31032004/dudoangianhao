# Script để đẩy code lên GitHub
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  DAY CODE LEN GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Kiểm tra Git
try {
    $gitVersion = git --version 2>&1
    Write-Host "[OK] Git da duoc cai dat: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "[LOI] Git chua duoc cai dat!" -ForegroundColor Red
    Write-Host "Vui long cai dat Git tu: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Bước 1: Khởi tạo Git (nếu chưa có)
if (-not (Test-Path .git)) {
    Write-Host "[1/6] Dang khoi tao Git repository..." -ForegroundColor Yellow
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[LOI] Khong the khoi tao Git!" -ForegroundColor Red
        exit 1
    }
    Write-Host "[OK] Da khoi tao Git repository" -ForegroundColor Green
} else {
    Write-Host "[OK] Git repository da ton tai" -ForegroundColor Green
}

Write-Host ""

# Bước 2: Thêm file
Write-Host "[2/6] Dang them cac file vao Git..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "[LOI] Khong the them file!" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Da them file" -ForegroundColor Green

Write-Host ""

# Bước 3: Tạo commit
Write-Host "[3/6] Dang tao commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Ung dung du doan gia nha"
if ($LASTEXITCODE -ne 0) {
    Write-Host "[CANH BAO] Co the da co commit truoc do" -ForegroundColor Yellow
}
Write-Host "[OK] Da tao commit" -ForegroundColor Green

Write-Host ""

# Bước 4: Đổi tên branch
Write-Host "[4/6] Dang doi ten branch thanh main..." -ForegroundColor Yellow
git branch -M main
Write-Host "[OK] Da doi ten branch" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  BUOC TIEP THEO (THU CONG):" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Tao repository tren GitHub:" -ForegroundColor Yellow
Write-Host "   - Truy cap: https://github.com/new" -ForegroundColor White
Write-Host "   - Dat ten repository (vi du: dudoangianha)" -ForegroundColor White
Write-Host "   - Chon PUBLIC" -ForegroundColor White
Write-Host "   - KHONG tich 'Initialize with README'" -ForegroundColor White
Write-Host "   - Click 'Create repository'" -ForegroundColor White
Write-Host ""
Write-Host "2. Copy URL repository (dang: https://github.com/USER/REPO.git)" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Chay lenh sau (THAY URL bang URL cua ban):" -ForegroundColor Yellow
Write-Host ""
Write-Host "   git remote add origin https://github.com/USER/REPO.git" -ForegroundColor Green
Write-Host "   git push -u origin main" -ForegroundColor Green
Write-Host ""
Write-Host "4. Neu yeu cau dang nhap:" -ForegroundColor Yellow
Write-Host "   - Dung Personal Access Token thay vi mat khau" -ForegroundColor White
Write-Host "   - Tao token tai: https://github.com/settings/tokens" -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Nhan Enter de ket thuc"

