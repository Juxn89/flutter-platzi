# 🍳 Recipe Book

A modern Flutter application for discovering and managing your favorite recipes. Built with clean architecture, state management, and multi-language support.

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue?logo=flutter)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?logo=dart)](https://dart.dev/) [![Provider](https://img.shields.io/badge/Provider-6.1.5-orange?logo=flutter)](https://pub.dev/packages/provider) [![Node.js](https://img.shields.io/badge/Node.js-Backend%20API-green?logo=node.js)](https://nodejs.org/) [![Express](https://img.shields.io/badge/Express-REST%20API-black?logo=express)](https://expressjs.com/)

## ✨ Features

- 📱 **Beautiful UI** - Modern Material Design interface
- 🌍 **Multi-language Support** - English and Spanish localization (i18n)
- ❤️ **Favorites System** - Save and manage your favorite recipes
- 📡 **REST API Integration** - Seamless data fetching from backend
- 🏗️ **Clean Architecture** - Provider pattern for state management
- 📱 **Cross-platform** - iOS, Android, Web, Windows, macOS, and Linux

## 🛠️ Technology Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.9.2 |
| **Language** | Dart |
| **State Management** | Provider 6.1.5 |
| **HTTP Client** | http 1.5.0 |
| **Logging** | Logger 2.6.2 |
| **Localization** | intl 0.20.2 |
| **Backend** | Node.js with Express |

## 📁 Project Structure

```
flutter-platzi/
├── recipe_book/                 # Flutter mobile application
│   ├── lib/
│   │   ├── main.dart           # Entry point
│   │   ├── const/              # Constants & color scheme
│   │   ├── helpers/            # Utility functions & logging
│   │   ├── l10n/               # Localization files
│   │   ├── models/             # Data models
│   │   ├── providers/          # State management
│   │   └── screens/            # UI screens
│   ├── android/                # Android native code
│   ├── ios/                    # iOS native code
│   ├── web/                    # Web build files
│   ├── linux/                  # Linux build files
│   ├── macos/                  # macOS build files
│   └── windows/                # Windows build files
├── recipes-api/                # Node.js backend API
│   ├── server.js              # Express server
│   ├── docker-compose.yml     # Docker configuration
│   └── data/                  # Recipe data
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- **Flutter**: Version 3.9.2 or higher
- **Dart**: Included with Flutter
- **Node.js**: For running the backend API
- **Git**: For cloning the repository

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Juxn89/flutter-platzi.git
   cd flutter-platzi
   ```

2. **Set up the Flutter app**
   ```bash
   cd recipe_book
   flutter pub get
   ```

3. **Set up the backend API**
   ```bash
   cd ../recipes-api
   npm install
   ```

### Running the Application

#### Backend API Server (Local Data Source)

The `recipes-api` is a Node.js/Express server that provides the recipe data. **You must start this server first** before running the Flutter app.

**Option 1: Direct npm start**
```bash
cd recipes-api
npm install
npm start
```

**Option 2: Docker (Recommended)**
```bash
cd recipes-api
docker-compose up
```

The API will be available at `http://localhost:3000`

#### Mobile App (Flutter)

Once the API server is running, start the Flutter application:

```bash
cd recipe_book
flutter pub get
flutter run
```

#### Complete Setup Script

To start both services simultaneously:

**Windows (PowerShell)**
```powershell
# Terminal 1: Start the API server
cd recipes-api
docker-compose up

# Terminal 2: Start the Flutter app
cd recipe_book
flutter run
```

**macOS/Linux**
```bash
# Terminal 1: Start the API server
cd recipes-api
docker-compose up &

# Terminal 2: Start the Flutter app
cd recipe_book
flutter run
```

## 📚 Key Screens

- **🏠 Home Screen** - Browse all available recipes
- **❤️ Favorites Screen** - Access your saved recipes
- **📖 Recipe Detail** - View complete recipe information with ingredients and instructions

## 🌐 Localization

The app supports multiple languages:
- 🇬🇧 English
- 🇪🇸 Spanish

Language files are located in `recipe_book/lib/l10n/` and use ARB format for easy translation.

## 🎨 Design Patterns

- **Provider Pattern** - For state management across the app
- **Model-View** - Clean separation of concerns
- **Repository Pattern** - Abstraction layer for API calls

## 📝 Available Scripts

```bash
# Generate localization files
flutter gen-l10n

# Run tests
flutter test

# Build for production
flutter build apk      # Android
flutter build ios      # iOS
flutter build web      # Web
```

## 🤝 Contributing

Contributions are welcome! Feel free to submit pull requests or open issues for bugs and feature requests.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

<div style="text-align: center; margin-top: 40px;">
  <p style="font-size: 14px; color: #666;">Made with ❤️ and ☕ from 🇳🇮, Juan Gómez</p>
</div>
