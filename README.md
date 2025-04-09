## 📘 Purpose
This project is a practice for structuring a modular iOS app using Swift Package Manager (SwiftPM).

## Architecture and Design Points
- The main app target only contains root files like AppDelegate.UI and logic are managed in Swift packages.
- It adopts dependency injection (DI) with the following structure:
    - features/: Contains modules for each feature, with separated UI logic and views.
    - libraries/: Shared logic across the app.
    - libraries/Core:
        - Defines ScreenProviderProtocol to handle screen transitions.
        - Designed to prevent circular dependencies between modules.

