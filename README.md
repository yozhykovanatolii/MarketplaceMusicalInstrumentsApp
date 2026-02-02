<div align="center">

# 🎸 InstrumentRental Mobile App

**Peer-to-Peer Marketplace for Musical Instruments & Equipment** 

</div>

## 📄 About

InstrumentRental is a mobile app for equipment owners and rental studios to manage local rentals. It helps reduce idle gear time and simplify bookings, while allowing musicians and event organizers to find and reserve nearby instruments efficiently. Features include inventory tracking, availability calendars, location-based search, and booking management.

## ✨ Features

- 🔐 **Authentication** – Sign up, login, password reset  
- 📦 **Listings** – Add/edit/delete equipment with photos & prices  
- 🔍 **Search** – Find equipment by title or category  
- 🎯 **Filters** – Filter by category, price range, minimum average rating, distance radius  
- 📅 **Availability Calendar** – Visual booking calendar per listing  
- ✅ **Booking System** – Reserve equipment for specific dates  
- ⭐ **Reviews & Ratings** – Rate instruments and owners  
- 📞 **Contact** – Get owner's phone number  
- 📍 **Interactive Map** – Dynamic loading on pan/zoom (Airbnb-style), shows user location  
- 🎨 **UI/UX** – Light/dark theme, multi-language support  
- 💖 **Favorites** – Save and manage favorite listings

## 🛠 Tech Stack

**Core Framework**
- **Flutter** – Cross-platform UI framework  
- **Dart** – Programming language

**State Management**
- **BLoC**
- **Cubit**

**Dependency Injection**
- **GetIt** – Service locator and dependency injection

**Backend & Cloud Services**
- **Firebase**
  - **Firebase Auth** – User authentication
  - **Cloud Firestore** – Real-time NoSQL database
- **Supabase** – File storage for photo instruments and user's avatar

**Navigation**
- **GoRouter** – Navigation and routing

**Maps & Geolocation**
- **Google Maps Flutter** – Interactive maps
- **Geolocator** – Location services
- **Permission Handler** – Permission management

**UI Components**
- **Table Calendar** – Calendar widget for booking
- **Flutter Rating Bar** – Star rating bar
- **Grouped List** – Sectioned list views
- **Iconsax** – Modern icon pack
- **Another Flutter Splash Screen** – Custom splash screen

**Media & Storage**
- **Image Picker** – Image selection from gallery
- **Shared Preferences** – Local data persistence (theme, language settings)

**Utilities**
- **UUID** – Unique ID generation

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>= 3.x)
- Dart
- Android Studio or VS Code
- Android emulator or physical Android device

### Installation
1. Clone the repository
```
git clone https://github.com/yozhykovanatolii/MarketplaceMusicalInstrumentsApp.git
```

2. Install dependencies
```
flutter pub get
```
3. Run the application
```
flutter run
```

## 📸 Screenshots
<details>
<summary>🔍 <strong>Search & Filter</strong></summary>
<div align="center">
<img src="screenshots/map.jpg" width="250" style="display: inline-block; margin: 10px;">
<img src="screenshots/filtration.jpg" width="250" style="display: inline-block; margin: 10px;">
<br>
Interactive Map • Advanced Filters
</div>
</details>

<details>
<summary>📋 <strong>Listing Details</strong></summary>
<div align="center">
<img src="screenshots/details.jpg" width="250" style="display: inline-block; margin: 10px;">
<img src="screenshots/about.jpg" width="250" style="display: inline-block; margin: 10px;">
<img src="screenshots/reviews.jpg" width="250" style="display: inline-block; margin: 10px;">
<br>
Listing Detail • About Tab • Reviews Tab
</div>
</details>

<details>
<summary>📅 <strong>Booking Flow</strong></summary>
<div align="center">
<img src="screenshots/calendar.jpg" width="250" style="display: inline-block; margin: 10px;">
<img src="screenshots/confirmation.jpg" width="250" style="display: inline-block; margin: 10px;">
<br>
Availability Calendar • Booking Confirmation
</div>
</details>

<details>
<summary>👤 <strong>Account Management</strong></summary>
<div align="center">
<img src="screenshots/my_listings.jpg" width="180" style="display: inline-block; margin: 5px;">
<img src="screenshots/booking_requests.jpg" width="180" style="display: inline-block; margin: 5px;">
<img src="screenshots/my_bookings_unconfirmed.jpg" width="180" style="display: inline-block; margin: 5px;">
<img src="screenshots/my_bookings_confirmed.jpg" width="180" style="display: inline-block; margin: 5px;">
<br>
My Listings • Incoming Requests • Pending Bookings • Confirmed Bookings
</div>
</details>

