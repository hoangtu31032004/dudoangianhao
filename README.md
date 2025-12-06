# Ứng dụng Dự đoán Giá Nhà

Ứng dụng web Streamlit để dự đoán giá nhà dựa trên các thông số đầu vào.

## Cài đặt

1. Cài đặt các thư viện cần thiết:
```bash
pip install -r requirements.txt
```

## Chạy ứng dụng

```bash
streamlit run app.py
```

Ứng dụng sẽ mở trong trình duyệt tại địa chỉ `http://localhost:8501`

## Tính năng

- Nhập các thông số về ngôi nhà:
  - Năm xây dựng
  - Tuổi ngôi nhà
  - Khoảng cách từ nhà đến trung tâm
  - Số cửa hàng xung quanh
  - Vĩ độ và Kinh độ
- Dự đoán giá nhà dựa trên các thông số đã nhập

## Lưu ý

Mô hình dự đoán hiện tại là một mô hình đơn giản. Để có kết quả chính xác hơn, bạn có thể:
- Thay thế hàm `predict_price()` bằng mô hình Machine Learning thực tế
- Sử dụng các thư viện như scikit-learn, XGBoost, hoặc TensorFlow
- Huấn luyện mô hình trên dữ liệu thực tế về giá nhà

