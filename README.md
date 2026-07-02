# Groove Tracker App

GrooveTracker is a modern iOS application focused on music discovery and management. It helps you explore new tracks and save your favorites while providing a seamless user experience. All of this is delivered through an elegant interface built entirely with Apple's native technologies.

## Key Features

* **Music Discovery:** Explore and discover new tracks seamlessly.
* **Favorites Management:** Save your favorite tracks to access them later easily.
* **Native Persistence:** Your favorite tracks are stored securely and efficiently on your device using SwiftData.
* **Modern UI:** Built with SwiftUI for a smooth and responsive user interface.

## Technologies Used

**User Interface (UI):** SwiftUI

**Persistence:** SwiftData

**Architecture:** Clean Architecture / MVVM (organized into `Features` and `Core` modules)

**Platform:** iOS (Native)

**Language:** Swift 5.9+

## Project Structure

The codebase is organized in a modular way following Clean Architecture principles to improve scalability and maintainability:

* `App/`: Contains the application's entry point (`GrooveTrackerApp.swift`) and the root view with the main navigation tabs.
* `Features/`: Main application features separated into modules, each with its own `Domain`, `Data`, and `Presentation` layers:
  * `Discovery/`: Track discovery and exploration logic and UI.
  * `Favorites/`: User interface and logic for managing your saved favorite tracks.
* `Core/`: Shared code used across the application.
  * `UIComponents/`: Reusable SwiftUI views and UI components.
  * `Networking/`: HTTP client and network services for API communication.
  * `Extensions/`: Utility extensions and global helpers.
* `Resources/`: Design assets, colors, and other resources.

## System Requirements

* **iOS:** 17.0 or later (due to the extensive use of SwiftData).
* **Development Environment:** Xcode 15.0 or later.

## Author

* [@juanvzreyes](https://github.com/juanvzreyes) — Creator and Developer.
