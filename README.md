<a name="readme-top"></a>

<!-- Top Links Bar -->

[![LinkedIn][linkedin-shield]][linkedin-url]
[![Twitter][twitter-shield]][twitter-url]
[![Instagram][instagram-shield]][instagram-url]

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <img src="images/logo.png" alt="Logo" width="80" height="80">
  <h1 align="center">Group Chat</h1>

  <p align="left">
     TDD, clean architecture and BloC Training app
  </p>

  <p align="left">
    <a href="https://github.com/foxnoir/japanese_tutorials_app/tree/develop/lib"><strong>Explore the project »</strong></a>
    <br/>
  </p>

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#style-guide">Style Guide</a>
      <ul>
        <li><a href="#color-palette">Color Palette</a></li>
      </ul>
      <ul>
        <li><a href="#fonts">Fonts</a></li>
      </ul>
      <ul>
        <li><a href="#icons">Icons</a></li>
      </ul>
      <ul>
        <li><a href="#final-layout">Final Layout</a></li>
      </ul>
    </li>
    <li><a href="#app-demonstration">App Demonstration</a>
      <ul>
        <li><a href="#happy-case">Happy Case</a></li>
        <li><a href="#error-handling">Error Handling</a></li>
      </ul>
    </li>
    <li><a href="#tech-stack">Tech Stack</a></li>
        <ul>
        <li><a href="#build-with">Build With</a></li>
      </ul>
    <li><a href="#getting-started">Getting Started</a></li>
        <ul>
        <li><a href="#generate-launcher-icon">Generate Launcher Icon</a></li>
        <li><a href="#generate-splash-screen">Generate Splash Screen</a></li>
      </ul>
    <li><a href="#app-architecture-and-folder-structure">App Architecture and Folder Structure</a>
      <ul>
        <li><a href="#feature-first-approach">Feature-First Approach</a></li>
        <li><a href="#explanation">Explanation</a>
          <ul>
            <li><a href="#data">Data</a></li>
            <li><a href="#domain">Domain</a></li>
            <li><a href="#presentation">Presentation</a></li>
            <li><a href="#global-widgets">Global Widgets</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#packages-and-reasons-for-use">Packages and Reasons for Use</a></li>
    <li><a href="#test-coverage">Test Coverage</a></li>
    <li><a href="#changelog">Changelog</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

---

## Style Guide

### Color Palette

<img src="images/palette.jpg" alt="palette" width="65%" height="100%">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Fonts

- [Default Flutter ios font (San Francisco)](https://developer.apple.com/fonts/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Icons

- [Default Flutter materials icons](https://api.flutter.dev/flutter/material/Icons-class.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Final Layout

<!-- <img src="images/finalLayout.png" alt="layout" width="100%" height="100%"> -->

[Image comming soon]

  <p align="left">
    <a href="#References-to-the-images-used"><strong>References to the images used »</strong></a>
    <br/>
  </p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **App Demonstration**

### **Happy Case**

[Video comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### **Error Handling**

[Video comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Tech Stack**

### Build With

- [![Flutter][flutter]][flutter-url]
- [![Dart][dart]][dart-url]
- [![Firebase][firebase]][firebase-url]

### Libraries, Packages And Tools

- [![Very][very-good]][very-good-url]
- **Local Storage**: Hive
- **Dependency Injection**: GetIt & Injectable
- **State Management**: Bloc & Flutter Bloc
- **Network**: Dio
- **Localization**: flutter_localizations & intl
- **Secure Storage**: flutter_secure_storage
- **Navigation**: Auto Route

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Getting Started**

### **Repository Cloning**

- Download or clone this repo by using the link or the SSH URL below:

```
https://github.com/foxnoir/japanese_tutorials_app.git
```

```
git@github.com:foxnoir/japanese_tutorials_app.git
```

- Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

```
flutter run
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Generate Launcher Icon

> :warning: **(Normally, this should not need to be executed.)**

```
flutter pub run flutter_launcher_icons:main
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Generate Splash Screen

```
flutter pub run flutter_native_splash:create
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## **App Architecture and Folder Structure**

```
flutter-app/
  ├── android
  ├── assets/
  │     ├── fonts/
  │     ├── icons/
  │     └── img/
  ├── build/
  ├── images/
  ├── ios/
  ├── lib/
  │     ├── core/
  │     │     ├── di/
  │     │     ├── log/
  │     │     ├── theme/
  │     │     └── utils/
  │     ├── features/
  │     │     └── hotels/
  │     │          ├── data/
  │     │          │     ├── models/
  │     │          │     ├── repositories/
  │     │          │     └── data_sources/
  │     │          ├── domain/
  │     │          │     ├── entities/
  │     │          │     ├── repositories/
  │     │          │     └── use_cases/
  │     │          └── presentation/
  │     │                ├── screens/
  │     │                ├── widgets/
  │     │                └── blocs/
  │     └── global_widgets
  │     └── main.dart
  ├── test/
  ├── web/
  └── pubspec.yaml
```

### **Feature-First Approach**

The `features/` folder structure groups code by **feature domains** (e.g., `hotels/`), enabling better maintainability and scalability. Changes to one feature do not affect other modules.

### **Explanation**

#### **Data**

- **models/**: Defines **data models** that come from APIs, JSON, or local data sources.  
  **Examples**: `hotel_model.dart`

- **repositories/**: Contains **implementation of repository interfaces** from the domain layer.  
  **Examples**: `hotel_repository_impl.dart`

- **data_sources/**: Defines **remote or local data sources** that access the API (e.g., Dio) or a local database (e.g., Hive).  
  **Examples**: `hotel_api_service.dart`, `local_hotel_data_source.dart`

#### **Domain**

- **entities/**: Defines **"pure" objects** that reflect business logic (independent of API).  
  **Examples**: `hotel_entity.dart`

- **repositories/**: Defines **abstract interfaces** for the repositories implemented in the **data layer**.  
  **Examples**: `hotel_repository.dart`

#### **Presentation**

- **screens/**: Defines **main screens** displayed to the user.  
  **Examples**: `hotel_list_screen.dart`, `hotel_detail_screen.dart`

- **widgets/**: Contains **reusable widgets** used in multiple screens.  
  **Examples**: `hotel_card.dart`, `loading_indicator.dart`

- **blocs/**: Contains **Bloc files** to manage the **state of the UI**.  
  **Examples**: `hotel_bloc.dart`, `hotel_event.dart`, `hotel_state.dart`

#### **Global Widgets**

Contains **reusable widgets** that can be used across multiple screens.  
 **Examples**: `app_card.dart`, `app_icon.dart`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## **Packages and Reasons for Use**

| **Package**               | **Reason**                                                                                |
| ------------------------- | ----------------------------------------------------------------------------------------- |
| **GetIt**                 | For Dependency Injection and access to services without direct initialization.            |
| **Injectable**            | Automatically generates DI configurations with `build_runner`, reducing boilerplate code. |
| **Dartz**                 | Provides "Functional Programming" concepts like `Either` for better error handling.       |
| **Equatable**             | Facilitates object comparison by automatically overriding `==` and `hashCode`.            |
| **Hive & Hive Flutter**   | Fast, lightweight, NoSQL database storage for quick local data storage.                   |
| **Dio**                   | Robust HTTP client with simple error handling, interceptors, and request cancellation.    |
| **connectivity_plus**     | Checks the network connection and provides real-time status updates.                      |
| **flutter_localizations** | Supports multi-language localization and internationalization (l10n).                     |
| **mocktail**              | Simple way to mock classes required for unit tests.                                       |
| **very_good_analysis**    | Ensures a consistent code style and code quality through strict linter rules.             |
| **bloc_test**             | Tests Bloc logic, verifying the sequence of state changes.                                |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Test Coverage**

[Image comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Changelog**

View changes and updates to the app [here](https://github.com/foxnoir/japanese_tutorials_app/blob/develop/CHANGELOG.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Acknowledgments**

- [Feature-first vs Layer-first Structure (Kody TechnoLab)](https://kodytechnolab.com/blog/layer-first-or-feature-first-flutter-project-structure/)
- [Flutter Project Structure (Code with Andrea)](https://codewithandrea.com/articles/flutter-project-structure/)
- [Dartz](https://medium.com/@samra.sajjad0001/exploring-the-purpose-and-usage-of-the-dartz-package-in-flutter-7902509939e9)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[dart]: https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white
[dart-url]: https://dart.dev/
[firebase]: https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white
[firebase-url]: https://firebase.google.com/
[flutter]: https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white
[flutter-url]: https://flutter.dev/
[instagram-shield]: https://img.shields.io/badge/Instagram-%23E4405F.svg?style=for-the-badge&logo=Instagram&logoColor=white
[instagram-url]: https://www.instagram.com/codeincouture/
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/tanja-polz-5636401a5/
[twitter-shield]: https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white
[twitter-url]: https://twitter.com/_foxnoir_?lang=de
[very-good]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very-good-url]: https://pub.dev/packages/very_good_analysis
