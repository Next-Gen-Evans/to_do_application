# 📋 To-Do App (Flutter)

A simple, clean, and fast **To-Do Application** built with **Flutter**.  
This app helps users create, manage, and track daily tasks with an intuitive and modern UI.

---

## 🚀 Features

- ✔️ Add new tasks  
- ✏️ Edit existing tasks  
- ❌ Delete tasks  
- 📌 Mark tasks as completed  
- 💾 Local storage (using SharedPreferences / Hive — choose the one you used)  
- 🎨 Beautiful and responsive UI  
- 📱 Works on both Android & iOS

---

## 🛠️ Tech Stack

| Component | Technology |
|----------|------------|
| Framework | Flutter |
| Language | Dart |
| State Management | Provider / GetX / Riverpod (select your actual one) |
| Storage | SharedPreferences / Hive |
| UI | Material Design |

---

## 📂 Project Structure
```
lib/
├── main.dart
├── models/
│ └── task_model.dart
├── screens/
│ └── home_screen.dart
├── widgets/
│ ├── task_item.dart
│ └── add_task_dialog.dart
├── providers/
│ └── task_provider.dart
└── services/
└── storage_service.dart
assets/
└── screenshots/
├── home_screen.png
├── add_task.png
└── completed_task.png

```

## 2. Install dependencies
```bash
flutter pub get
```

## 3. Run the app
```bash
flutter run
```

## 🧪 Running Tests
```bash
flutter test
```

## 📦 Build APK
```bash
flutter build apk
```

## 💡 Author

Developed by Evans 
