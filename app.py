import streamlit as st

# Cấu hình trang
st.set_page_config(
    page_title="Dự đoán giá nhà",
    page_icon="🏠",
    layout="centered"
)

# CSS tùy chỉnh
st.markdown("""
    <style>
    .main {
        padding: 2rem;
    }
    .stNumberInput > div > div > input {
        text-align: center;
        font-size: 16px;
    }
    .prediction-box {
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
        border-radius: 10px;
        padding: 20px;
        margin-top: 20px;
        text-align: center;
    }
    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 2rem;
    }
    h3 {
        margin-top: 1.5rem;
        margin-bottom: 0.5rem;
        font-size: 1.1rem;
    }
    .stButton > button {
        width: 100%;
        font-size: 18px;
        padding: 0.75rem;
    }
    </style>
""", unsafe_allow_html=True)

# Tiêu đề
st.markdown('<h1>🏠 Dự đoán giá nhà</h1>', unsafe_allow_html=True)

# Hàm dự đoán giá nhà (mô hình đơn giản)
def predict_price(date, age, distance, stores, latitude, longitude):
    """
    Hàm dự đoán giá nhà dựa trên các thông số đầu vào
    Đây là một mô hình đơn giản, bạn có thể thay thế bằng mô hình ML thực tế
    """
    # Mô hình đơn giản: giá cơ bản trừ đi các yếu tố giảm giá
    base_price = 12700
    
    # Yếu tố tích cực
    # Nhà mới hơn (năm xây dựng gần đây) = giá cao hơn
    house_newness = (2024 - date)  # Số năm từ khi xây dựng
    new_house_bonus = max(0, (10 - house_newness) * 35)  # Nhà dưới 10 năm = bonus
    
    stores_bonus = stores * 95  # Nhiều cửa hàng = giá cao hơn
    
    # Vị trí tốt (gần trung tâm TP.HCM)
    center_lat, center_lon = 10.8231, 106.6297
    location_distance = abs(latitude - center_lat) + abs(longitude - center_lon)
    location_bonus = max(0, (0.5 - location_distance) * 280)  # Gần trung tâm = bonus
    
    # Yếu tố tiêu cực
    age_penalty = age * 75  # Nhà cũ hơn = giá thấp hơn
    distance_penalty = distance * 115  # Xa trung tâm = giá thấp hơn
    
    predicted_price = base_price + new_house_bonus + stores_bonus + location_bonus - age_penalty - distance_penalty
    
    # Đảm bảo giá không âm và làm tròn
    predicted_price = max(5000, predicted_price)
    
    return round(predicted_price, 0)

# Khởi tạo session state
if 'predicted_price' not in st.session_state:
    st.session_state.predicted_price = None

# Form nhập liệu
col1, col2, col3 = st.columns([1, 2, 1])

with col2:
    with st.form("prediction_form"):
        # Năm xây dựng
        st.markdown("### 📅 Năm xây dựng (Date)")
        date = st.number_input(
            "Năm xây dựng",
            min_value=1900,
            max_value=2024,
            value=2021,
            step=1,
            label_visibility="collapsed",
            key="date_input"
        )
        
        # Tuổi ngôi nhà
        st.markdown("### 📜 Tuổi ngôi nhà (Age)")
        age = st.number_input(
            "Tuổi ngôi nhà",
            min_value=0,
            max_value=100,
            value=4,
            step=1,
            label_visibility="collapsed",
            key="age_input"
        )
        
        # Khoảng cách từ nhà đến trung tâm
        st.markdown("### 🚚 Khoảng cách từ nhà đến trung tâm (Distance)")
        distance = st.number_input(
            "Khoảng cách (km)",
            min_value=0.0,
            max_value=50.0,
            value=5.00,
            step=0.1,
            format="%.2f",
            label_visibility="collapsed",
            key="distance_input"
        )
        
        # Số cửa hàng xung quanh
        st.markdown("### 🏪 Số cửa hàng xung quanh (Stores)")
        stores = st.number_input(
            "Số cửa hàng",
            min_value=0,
            max_value=50,
            value=5,
            step=1,
            label_visibility="collapsed",
            key="stores_input"
        )
        
        # Vĩ độ
        st.markdown("### 📍 Vĩ độ (Latitude)")
        latitude = st.number_input(
            "Vĩ độ",
            min_value=0.0,
            max_value=90.0,
            value=10.75,
            step=0.01,
            format="%.2f",
            label_visibility="collapsed",
            key="latitude_input"
        )
        
        # Kinh độ
        st.markdown("### 📍 Kinh độ (Longitude)")
        longitude = st.number_input(
            "Kinh độ",
            min_value=0.0,
            max_value=180.0,
            value=106.65,
            step=0.01,
            format="%.2f",
            label_visibility="collapsed",
            key="longitude_input"
        )
        
        # Nút dự đoán
        st.markdown("<br>", unsafe_allow_html=True)
        predict_button = st.form_submit_button("🔍 Dự đoán", use_container_width=True)
        
        # Xử lý khi nhấn nút dự đoán
        if predict_button:
            st.session_state.predicted_price = predict_price(date, age, distance, stores, latitude, longitude)

# Hiển thị kết quả nếu đã dự đoán
if st.session_state.predicted_price is not None:
    with col2:
        st.markdown(f"""
        <div class="prediction-box">
            <h2>💰 Giá dự đoán: {st.session_state.predicted_price:,.0f} USD</h2>
        </div>
        """, unsafe_allow_html=True)

