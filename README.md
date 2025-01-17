<a name="readme-top"></a>

<!-- Top Links Bar -->

[![LinkedIn][linkedin-shield]][linkedin-url]
[![Twitter][twitter-shield]][twitter-url]
[![Instagram][instagram-shield]][instagram-url]

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <img src="images/logo.png" alt="Logo" width="80" height="80">
  <h1 align="center">TDD and clean architecture</h1>

  <p align="left">
     TDD clean architecture dummy app inspired by 
     <a href="https://github.com/dastagir-ahmed"><strong>Dastagir Ahmed</strong></a> .
  </p>
  
  <p align="left">
    <a href="https://github.com/foxnoir/TTD_clean_architecture_dummy/tree/develop/lib"><strong>Explore the project »</strong></a>
    <br/>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#clean-architecture-roadmap">Clean Architecture Roadmap</a>
      <ul>
        <li><a href="#domain-layer">Domain Layer</a></li>
      </ul>
      <ul>
        <li><a href="#data-layer">Data Layer</a></li>
      </ul>
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
      <ul>
        <li><a href="#most-important-packages-and-tools">Most important Packages and Tools</a></li>
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

## Clean Architecture Roadmap

Work through the layers one after the other.
What the individual classes do is usually described in more detail in the classes themselves.

### Domain Layer

#### 1.<ins>entities using [equatable](https://pub.dev/packages/equatable)</ins>

#### Why do we need `equatable` in Flutter?

The `equatable` package is an essential tool in Flutter that simplifies object equality comparisons. It is particularly useful in scenarios such as state management and comparing data models. Here is a detailed explanation of why `equatable` is needed:

#### Benefits of `equatable`

1. **Simplifies Equality Comparisons**  
   Dart’s default equality checks are based on reference equality (`==` compares object references). This can lead to issues when dealing with objects that should be compared by their values instead of their memory addresses.

2. **Reduces Boilerplate Code**  
   Without `equatable`, you would need to manually override `==` and `hashCode` for every class that requires custom equality comparison. `equatable` simplifies this by requiring only a `props` list to define the fields for comparison.

3. **Essential for State Management**  
   In state management solutions like **Bloc**, proper equality checks are critical for detecting state changes. `equatable` ensures that states are compared based on their property values, preventing unnecessary widget rebuilds.

4. **Improves Code Readability**  
   By removing verbose equality logic, `equatable` makes code cleaner and more maintainable.

5. **Supports Better Testing**  
   When writing unit tests, `equatable` allows you to compare objects directly without implementing custom equality logic.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 2. <ins>repositories using [dartz](https://pub.dev/packages/dartz/versions)</ins>

#### Why do we need `dartz` in Flutter?

The `dartz` package brings **functional programming concepts** to Dart, allowing developers to write safer and more expressive code. It is particularly useful for handling errors, managing optional values, and composing functional operations in Flutter apps.

#### Benefits of `dartz`

1. **Provides `Either` for Error Handling**  
   The `Either` type is a powerful way to handle success (`Right`) and failure (`Left`) in a single object. It eliminates the need for throwing exceptions and simplifies error propagation.

2. **Optional Values with `Option`**  
   `Option` helps manage nullable data without relying on `null`, enforcing safer code by explicitly handling the absence of a value.

3. **Immutability Support**  
   Functional programming principles like immutability are easy to implement with `dartz`, helping you build predictable and bug-free code.

4. **Functional Programming Utilities**  
   `dartz` includes functional constructs like `fold`, `map`, and `flatMap` for transforming and chaining operations cleanly.

5. **Cleaner Code and Better Testing**  
   By using `dartz`, your code becomes more declarative and testable, as error paths and nullable values are explicitly defined.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 3. <ins>usecases</ins>

Write a usecase for each methos functionality in a repository.

Write tests:

- What does the class depend on?
- How can we create a fake version of the dependency?
- How do we control what our dependencies do?

Get tests past. (Implement usecase methos functionality.)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### Why Are Use Cases Important in Clean Architecture?

In **Clean Architecture**, use cases are at the core of the application’s business logic. They define **what** the application should do, regardless of **how** it is implemented. Here’s why they are crucial:

#### What Is a Use Case?

A **Use Case** is a class or function that represents a **specific task or action** the user or system performs within the application.

**Examples:**

- Logging in a user.
- Fetching a list of items.
- Submitting a form.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### Responsibilities of Use Cases

1. **Encapsulating Business Logic**  
   Use cases contain business rules and ensure no logic leaks into other layers, like the UI or data layers.

2. **Framework Independence**  
   Use cases are not tied to external libraries or UI technologies, making them platform-agnostic.

3. **Communication Between Layers**  
   Use cases act as a **bridge** between the **UI layer** and the **data layer**.

#### Why Are Use Cases Important?

- **Encapsulate Business Logic:** Keep the logic separate from the UI and data layers.
- **Reusability:** Use cases can be shared across platforms.
- **Testability:** They are easy to isolate and test.
- **Separation of Concerns:** By separating concerns, they make the code more maintainable.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Data Layer

#### 1. <ins>models extenting entities using [mappable](https://pub.dev/packages/dart_mappable)</ins>

Create Models.

Write test using json-files to mimic server.

#### 2. <ins>Implement Repositories</ins>

Create datasource interface, datasource impl. and implement repos. (no logic)

Write tests.

Get tests past. (Implement repo methos functionality.)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Style Guide

### Color Palette

[Image comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Fonts

[Fonts comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Icons

- [Default Flutter materials icons](https://api.flutter.dev/flutter/material/Icons-class.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Final Layout

<!-- <img src="images/finalLayout.png" alt="layout" width="100%" height="100%"> -->

[Image comming soon]

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
- [![Mockapi][mockapi]][mockapi-url]

### Most Important Packages and Tools

[![Auto Route][auto-route]][auto-route-url]
[![Bloc][bloc]][bloc-url]
[![Dartz][dartz]][dartz-url]
[![Dio][dio]][dio-url]
[![Equatable][equatable]][equatable-url]
[![Flutter Bloc][flutter-bloc]][flutter-bloc-url]
[![Flutter Localizations][flutter-localizations]][flutter-localizations-url]
[![Flutter Secure Storage][flutter-secure-storage]][flutter-secure-storage-url]
[![Freezed][freezed]][freezed-url]
[![GetIt][get-it]][get-it-url]
[![Hive][hive]][hive-url]
[![Injectable][injectable]][injectable-url]
[![Intl][intl]][intl-url]
[![Mappable][mappable]][mappable-url]
[![Mocktail][mocktail]][mocktail-url]
[![Very Good Analysis][very-good]][very-good-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Getting Started**

### **Repository Cloning**

- Download or clone this repo by using the link or the SSH URL below:

```
https://github.com/foxnoir/TTD_clean_architecture_dummy.git
```

```
git@github.com:foxnoir/TTD_clean_architecture_dummy.git
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
  │     │     ├── errors/
  │     │     ├── localization/
  │     │     ├── log/
  │     │     ├── router/
  │     │     ├── theme/
  │     │     ├── usecases/
  │     │     └── utils/
  │     ├── features/
  │     │     └── feature/
  │     │          ├── data/
  │     │          │     ├── models/
  │     │          │     ├── repositories/
  │     │          │     └── data_sources/
  │     │          ├── domain/
  │     │          │     ├── entities/
  │     │          │     ├── repositories/
  │     │          │     └── usecases/
  │     │          └── presentation/
  │     │                ├── views/
  │     │                ├── widgets/
  │     │                └── bloc/
  │     │     └── navigation/
  │     │     └── storage/
  │     └── global_widgets
  │     └── main.dart
  ├── test/
  ├── web/
  └── pubspec.yaml
```

### **Feature-First Approach**

The `features/` folder structure groups code by **feature domains**, enabling better maintainability and scalability. Changes to one feature do not affect other modules.

### **Explanation**

#### **Data**

- **models/**: Defines **data models** that come from APIs, JSON, or local data sources.

- **repositories/**: Contains **implementation of repository interfaces** from the domain layer.

- **data_sources/**: Defines **remote or local data sources** that access the API (e.g., Dio) or a local database (e.g., Hive).

#### **Domain**

- **entities/**: Defines **"pure" objects** that reflect business logic (independent of API).

- **repositories/**: Defines **abstract interfaces** for the repositories implemented in the **data layer**.

#### **Presentation**

- **screens/**: Defines **main screens** displayed to the user.

- **widgets/**: Contains **reusable widgets** used in multiple screens.

- **blocs/**: Contains **Bloc files** to manage the **state of the UI**.

#### **Global Widgets**

Contains **reusable widgets** that can be used across multiple screens.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## **Packages and Reasons for Use**

| **Package**               | **Reason**                                                                                |
| ------------------------- | ----------------------------------------------------------------------------------------- |
| **bloc_test**             | Tests Bloc logic, verifying the sequence of state changes.                                |
| **Dartz**                 | Provides "Functional Programming" concepts like `Either` for better error handling.       |
| **Equatable**             | Facilitates object comparison by automatically overriding `==` and `hashCode`.            |
| **flutter_localizations** | Supports multi-language localization and internationalization (l10n).                     |
| **GetIt**                 | For Dependency Injection and access to services without direct initialization.            |
| **Injectable**            | Automatically generates DI configurations with `build_runner`, reducing boilerplate code. |
| **mocktail**              | Simple way to mock classes required for unit tests.                                       |
| **very_good_analysis**    | Ensures a consistent code style and code quality through strict linter rules.             |
|                           |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Test Coverage**

[Image comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Changelog**

View changes and updates to the app [here](https://github.com/foxnoir/TTD_clean_architecture_dummy/blob/develop/CHANGELOG.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Acknowledgments**

- [Feature-first vs Layer-first Structure (Kody TechnoLab)](https://kodytechnolab.com/blog/layer-first-or-feature-first-flutter-project-structure/)
- [Flutter Project Structure (Code with Andrea)](https://codewithandrea.com/articles/flutter-project-structure/)
- [Dartz](https://medium.com/@samra.sajjad0001/exploring-the-purpose-and-usage-of-the-dartz-package-in-flutter-7902509939e9)
- [TDD](https://www.browserstack.com/guide/tdd-in-flutter)
- [clean architecture](https://dev.to/marwamejri/flutter-clean-architecture-1-an-overview-project-structure-4bhf)
- [Mocktail](https://www.dbestech.com/tutorials/flutter-test-with-mocktail)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
[auto-route]: https://img.shields.io/badge/Auto%20Route-00D09C.svg?style=for-the-badge&logo=autoroute&logoColor=white
[auto-route-url]: https://pub.dev/packages/auto_route

[auto-route]: https://img.shields.io/badge/Auto%20Route-00D09C.svg?style=for-the-badge&logo=autoroute&logoColor=white
[auto-route-url]: https://pub.dev/packages/auto_route
[bloc]: https://img.shields.io/badge/Bloc-8B0000.svg?style=for-the-badge&logo=bloc&logoColor=white
[bloc-url]: https://pub.dev/packages/bloc
[dart]: https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white
[dart-url]: https://dart.dev/
[dio]: https://img.shields.io/badge/Dio-FE5000.svg?style=for-the-badge&logo=internet-explorer&logoColor=white
[dio-url]: https://pub.dev/packages/dio
[dartz]: https://img.shields.io/badge/Dartz-1C4E80.svg?style=for-the-badge&logo=dart&logoColor=white
[dartz-url]: https://pub.dev/packages/dartz
[equatable]: https://img.shields.io/badge/Equatable-32CD32.svg?style=for-the-badge&logo=equatable&logoColor=white
[equatable-url]: https://pub.dev/packages/equatable
[firebase]: https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=firebase&logoColor=white
[firebase-url]: https://firebase.google.com/
[flutter]: https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-url]: https://flutter.dev/
[flutter-bloc]: https://img.shields.io/badge/Flutter%20Bloc-2E86C1.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-bloc-url]: https://pub.dev/packages/flutter_bloc
[flutter-localizations]: https://img.shields.io/badge/Flutter%20Localizations-0170F3.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-localizations-url]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[flutter-secure-storage]: https://img.shields.io/badge/Flutter%20Secure%20Storage-2F4F4F.svg?style=for-the-badge&logo=lock&logoColor=white
[flutter-secure-storage-url]: https://pub.dev/packages/flutter_secure_storage
[get-it]: https://img.shields.io/badge/GetIt-007ACC.svg?style=for-the-badge&logo=getit&logoColor=white
[get-it-url]: https://pub.dev/packages/get_it
[hive]: https://img.shields.io/badge/Hive-FFB300.svg?style=for-the-badge&logo=hive&logoColor=white
[hive-url]: https://pub.dev/packages/hive
[injectable]: https://img.shields.io/badge/Injectable-009688.svg?style=for-the-badge&logo=injectable&logoColor=white
[injectable-url]: https://pub.dev/packages/injectable
[intl]: https://img.shields.io/badge/Intl-FFA500.svg?style=for-the-badge&logo=dart&logoColor=white
[intl-url]: https://pub.dev/packages/intl
[instagram-shield]: https://img.shields.io/badge/Instagram-%23E4405F.svg?style=for-the-badge&logo=instagram&logoColor=white
[instagram-url]: https://www.instagram.com/codeincouture/
[license-shield]: https://img.shields.io/badge/License-MIT-%23000000.svg?style=for-the-badge&logo=license&logoColor=white
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/LinkedIn-%230A66C2.svg?style=for-the-badge&logo=linkedin&logoColor=white
[linkedin-url]: https://www.linkedin.com/in/tanja-polz-5636401a5/
[mappable]: https://img.shields.io/badge/Dart%20Mappable-008080.svg?style=for-the-badge&logo=dart&logoColor=white
[mappable-url]: https://pub.dev/packages/dart_mappable
[mockapi]: https://img.shields.io/badge/MockAPI-9cf.svg?style=for-the-badge&logo=api&logoColor=white
[mockapi-url]: https://mockapi.io/projects
[mocktail]: https://img.shields.io/badge/Mocktail-blue.svg?style=for-the-badge&logo=dart&logoColor=white
[mocktail-url]: https://pub.dev/packages/mocktail
[twitter-shield]: https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=twitter&logoColor=white
[twitter-url]: https://twitter.com/_foxnoir_?lang=de
[very-good]: https://img.shields.io/badge/Very%20Good%20Analysis-B22C89.svg?style=for-the-badge&logo=verygood&logoColor=white
[very-good-url]: https://pub.dev/packages/very_good_analysis
