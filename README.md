# 🎨 Liany Admin Template

> Template admin dashboard Flutter yang modern, responsif, dan siap pakai untuk membangun aplikasi admin panel atau dashboard management dengan cepat.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.10.3+-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📸 Screenshot

![Dashboard Preview](https://via.placeholder.com/800x450.png?text=Dashboard+Preview)
![Users Management](https://via.placeholder.com/800x450.png?text=Users+Management)

## ✨ Fitur Utama

- 📊 **Dashboard Interaktif** - Statistik real-time dengan charts dan visualisasi data menggunakan fl_chart
- 👥 **User Management** - Tabel pengguna lengkap dengan search, filter, pagination, dan action buttons
- ⚙️ **Settings Panel** - Pengaturan profil, notifikasi, keamanan, dan preferensi akun
- 🎨 **Material Design 3** - UI modern dengan Google Fonts (Inter) dan color scheme Indigo
- 📱 **Fully Responsive** - Otomatis menyesuaikan layout untuk mobile, tablet, dan desktop
- 🎯 **Sidebar Navigation** - Sidebar yang dapat di-collapse dengan smooth animations
- 📈 **Charts & Analytics** - Visualisasi data dengan line charts, bar charts, dan progress indicators
- 🎭 **Easy Theming** - Sistem tema terpusat yang mudah dikustomisasi
- 🔍 **Search & Filter** - Fitur pencarian dan filter real-time di halaman users
- 💫 **Smooth Animations** - Transisi dan animasi yang halus di seluruh aplikasi

## 🚀 Quick Start

### Prerequisites

- Flutter SDK 3.10.3 atau lebih baru
- Dart SDK 3.0+
- Chrome browser (untuk web development)

### Installation

1. **Clone repository**
   ```bash
   git clone https://github.com/yourusername/lianytemplate.git
   cd lianytemplate
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run aplikasi**
   
   Untuk Web:
   ```bash
   flutter run -d chrome
   ```
   
   Untuk Mobile (Android/iOS):
   ```bash
   flutter run
   ```
   
   Untuk Desktop (Windows/macOS/Linux):
   ```bash
   flutter run -d windows   # atau macos, linux
   ```

### Build untuk Production

```bash
# Build Web
flutter build web

# Build APK (Android)
flutter build apk --release

# Build App Bundle (Android)
flutter build appbundle

# Build iOS
flutter build ios --release

# Build Desktop
flutter build windows --release
```

## 📁 Struktur Folder

```
lib/
├── core/
│   ├── constants/     # Konstanta aplikasi (colors, constants)
│   └── theme/         # Tema aplikasi
├── models/            # Data models
├── screens/           # Halaman-halaman aplikasi
│   ├── dashboard/     # Dashboard screen
│   ├── users/         # User management screen
│   ├── settings/      # Settings screen
│   └── layout/        # Main layout
├── widgets/           # Reusable widgets
│   ├── sidebar/       # Sidebar navigation
│   ├── appbar/        # Custom app bar
│   └── cards/         # Card widgets
└── main.dart          # Entry point
```

## 🎨 Customisasi

### Mengubah Warna Tema

Edit file `lib/core/constants/app_colors.dart`:

```dart
static const Color primary = Color(0xFF6366F1); // Ubah warna primary
```

### Menambah Menu Baru

Edit file `lib/widgets/sidebar/admin_sidebar.dart`:

```dart
MenuItem(
  title: 'Menu Baru',
  icon: Icons.new_icon,
  route: '/menu-baru',
),
```

### Menambah Halaman Baru

1. Buat file baru di `lib/screens/nama_screen/`
2. Tambahkan route di `lib/screens/layout/admin_layout.dart`

## 📦 Dependencies

| Package | Version | Deskripsi |
|---------|---------|-----------|
| [google_fonts](https://pub.dev/packages/google_fonts) | ^6.2.1 | Typography dengan Google Fonts (Inter) |
| [fl_chart](https://pub.dev/packages/fl_chart) | ^0.69.0 | Chart dan visualisasi data yang powerful |
| [provider](https://pub.dev/packages/provider) | ^6.1.2 | State management yang simple dan efisien |
| [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) | ^10.8.0 | 1500+ icon dari Font Awesome |
| [intl](https://pub.dev/packages/intl) | ^0.19.0 | Format tanggal, waktu, dan angka |

## 🎯 Halaman yang Tersedia

### ✅ Implemented

| Halaman | Fitur | Status |
|---------|-------|--------|
| **Dashboard** | • 4 Stat cards (Users, Revenue, Orders, Bounce Rate)<br>• Revenue line chart dengan animasi<br>• Recent activities list<br>• Top products table<br>• Users by country dengan progress bars<br>• Responsive grid layout | ✅ Complete |
| **Users Management** | • Data table dengan 50+ sample users<br>• Search real-time<br>• Filter by role & status<br>• Gradient avatars<br>• Role badges (Admin, Moderator, User)<br>• Status indicators (Active/Inactive)<br>• Action buttons (Edit, Delete)<br>• Pagination footer | ✅ Complete |
| **Settings** | • Profile management<br>• Notification preferences<br>• Security settings<br>• Account preferences<br>• Form validation<br>• Save changes functionality | ✅ Complete |

### 🚧 Coming Soon

- **Products** - Product inventory management
- **Orders** - Order tracking and management
- **Analytics** - Advanced analytics dan reporting

## 🎨 Design System

### Color Palette

```dart
Primary Color:   #6366F1 (Indigo 500)
Primary Dark:    #4F46E5 (Indigo 600)
Primary Light:   #818CF8 (Indigo 400)
Background:      #F5F5F9 (Gray 50)
Success:         #10B981 (Green 500)
Warning:         #F59E0B (Amber 500)
Error:           #EF4444 (Red 500)
```

### Typography

- **Font Family:** Inter (Google Fonts)
- **Heading:** 24-32px, Bold
- **Body:** 14-16px, Regular
- **Caption:** 12px, Regular

### Spacing System

```dart
xxs: 4px
xs:  8px
sm:  12px
md:  16px
lg:  24px
xl:  32px
xxl: 48px
```

## 🛠️ Tech Stack

- **Framework:** Flutter 3.10.3+
- **Language:** Dart 3.0+
- **State Management:** Provider
- **UI Library:** Material Design 3
- **Charts:** FL Chart
- **Fonts:** Google Fonts (Inter)
- **Icons:** Material Icons + Font Awesome

## 💡 Development Tips

### Hot Reload
Tekan `r` di terminal untuk hot reload saat development

### Debug Mode
```bash
flutter run --debug
```

### Performance Profiling
```bash
flutter run --profile
```

### Analyze Code Quality
```bash
flutter analyze
```

### Format Code
```bash
flutter format lib/
```

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 📚 Documentation

Dokumentasi lengkap tersedia di [DOCUMENTATION.md](DOCUMENTATION.md)

- Architecture Overview
- Component Documentation
- API Reference
- Best Practices
- Troubleshooting

## 🐛 Known Issues

- Analyzer false positive errors di VS Code - restart IDE untuk fix
- Chrome browser cache - clear cache jika ada masalah display

## 🤝 Contributing

Kontribusi sangat diterima! Silakan:

1. Fork repository ini
2. Buat feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## 📄 License

Template ini **gratis dan open source** untuk digunakan dalam project pribadi maupun komersial.

```
MIT License - Silakan gunakan, modifikasi, dan distribute sesuai kebutuhan.
```

## 👨‍💻 Author

**Liany Admin Template**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - UI Framework yang luar biasa
- [Material Design 3](https://m3.material.io) - Design system
- [FL Chart](https://github.com/imaNNeo/fl_chart) - Beautiful charts
- [Google Fonts](https://fonts.google.com) - Typography

---

<div align="center">
  
### ⭐ Jika template ini membantu, jangan lupa beri star!

Made with ❤️ using Flutter design by Herry Prasetyo

**[Report Bug](https://github.com/yourusername/lianytemplate/issues)** · **[Request Feature](https://github.com/yourusername/lianytemplate/issues)**

</div>
