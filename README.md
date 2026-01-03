## 📱 Ecommerce App – Flutter

### 🚀 A Modern & Scalable Ecommerce Mobile Application

A **modern, scalable, and production-ready eCommerce mobile application** built with **Flutter**.  
This project follows **clean architecture principles** and uses **GetX** for state management, dependency injection, and routing.

The app provides **secure authentication**, **product browsing**, **cart & checkout**, **SSLCommerz payment integration**, **localization**, **Firebase analytics**, and **crash monitoring**.

---

## 🚀 Features

### 🛒 Core Ecommerce Features
- User registration and login
- Product listing with category browsing
- Product details with image gallery
- Add to cart and update cart items
- Checkout and order placement

### 🔐 Authentication & Security
- Token-based authentication system
- Secure API communication
- Session persistence using **SharedPreferences**
- Auto-login on application startup

### 💳 Payment Integration
- Online payment gateway integration using **SSLCommerz**

### 📡 Networking & API Handling
- Custom `NetworkCaller` for REST API communication
- Centralized response handling with `NetworkResponse`
- Token support for secure API requests
- Global error handling strategy

### 🎨 UI & User Experience
- Fully responsive UI layout
- Carousel slider for banners
- SVG image support
- SafeArea usage for device compatibility
- Reusable widgets and modular screen architecture

### 🧠 State Management (GetX)
- Built using **GetX**
- Feature-based controllers
- Dependency Injection
- Route & navigation management
- Supports both `GetBuilder` and `Obx`

### ⚙️ Utilities & Helpers
- App version info using `package_info_plus`
- Debug logging with `logger`
- Local caching via `SharedPreferences`

### 📊 Analytics & Stability
- **Firebase Analytics** for user behavior tracking
- **Firebase Crashlytics** for real-time crash reporting

### 🌍 Localization
- Multi-language ready
- Built using Flutter localization framework
- Powered by the `intl` package

---

## 📦 Technology Stack

| Category | Technologies |
|--------|-------------|
| Framework | Flutter, Dart |
| State Management | GetX |
| Backend | REST API, HTTP |
| Firebase | Core, Analytics, Crashlytics |
| Local Storage | SharedPreferences |
| Payment Gateway | SSLCommerz |
| UI Tools | Carousel Slider, Flutter SVG |
| Utilities | Intl, Logger, Package Info Plus |

---

## 📸 Screenshots

### 🏠 Home Screen
<img width="1600" height="957" alt="Home Screen" src="https://github.com/user-attachments/assets/78477954-e967-4278-b88a-b280220f7e94" />

---

## ⚙️ How to Run the Project
1. Clone the repository
  git clone https://github.com/prottoykundu38/Ostad_Flutter_Batch_10/tree/E-commerce-app
   
2. Go to the project directory
     cd todo_list

3. Install dependencies
     flutter pub get

4. Run the app
     flutter run

## 📦 Dependencies

### Core Flutter
- flutter_localizations
- cupertino_icons

### State Management
- get

### Networking
- http

### Firebase
- firebase_core
- firebase_analytics
- firebase_crashlytics

### UI & UX
- flutter_svg
- carousel_slider
- pin_code_fields

### Storage & Utilities
- shared_preferences
- package_info_plus
- logger

### Payment
- flutter_sslcommerz

### Localization
- intl

---

## 🛠 Future Enhancements
- Wishlist feature
- Order history and tracking
- Push notifications
- Payment confirmation UI
- Dark mode support

