# Brandie Smart Posts

A Flutter implementation of the **Smart Post / Quick Share** experience provided for the Brandie Flutter Developer Assignment.

The project focuses on translating the supplied Figma design into a polished, responsive Flutter interface while demonstrating clean code organisation, reusable UI components, predictable state management, and thoughtful handling of loading and editing states.

## Features

- Multi-step Smart Post generation experience
- Swipeable Smart Post carousel
- Product promotion information
- Recommended song section
- AI-generated caption suggestion
- Expandable caption content
- Full-screen caption editor
- Referral code and sales-link presentation
- Quick-share actions for multiple social platforms
- Four-stage share preparation animation
- Full-screen blurred loading overlay
- Responsive layouts for different mobile screen sizes
- Local assets and mock data for a reliable offline demonstration

## Technology

- Flutter and Dart
- Riverpod for state management
- Material UI components

## Architecture

The project uses a **lightweight feature-first layered architecture**.

The application is intentionally not divided into a large number of abstract repositories, use cases, DTOs, and service interfaces because the assignment is primarily a frontend implementation with mock data. The structure keeps responsibilities separate without adding unnecessary complexity.

```text
Presentation
    ↓ user actions / watches provider
Controllers
    ↓ manages states
State
    ↓ rendered by the presentation layer
Mock data and models
```

### Architectural responsibilities

#### Presentation layer

The presentation layer contains screens and reusable widgets. It is responsible only for:

- Building the interface
- Displaying the current Riverpod state
- Forwarding user actions to controllers
- Managing temporary widget-owned objects such as `PageController`, `TextEditingController`, and `FocusNode`

It does not perform data-loading or workflow logic directly.

#### Controller layer

Controllers contain the feature behaviour and coordinate state changes.

- `SmartPostController` manages Smart Post generation, post selection, caption state, and post updates.
- `SharePreparationController` manages the staged share-preparation workflow.

Controllers do not store `BuildContext` and do not build or display widgets.

#### State layer

State classes describe everything the interface needs to render at a given moment, including:

- Current loading status
- Generated posts
- Selected carousel index
- Generation progress
- Caption expansion
- Share-preparation progress
- Loading and error conditions

State is updated immutably so changes remain predictable and easy to follow.

#### Data layer

The data layer contains the Smart Post models and local mock content used by the assignment.

The mock data is separated from widgets so the presentation can later be connected to a repository or API without redesigning the interface.

#### Core layer

The core layer contains application-wide resources shared across features:

- Asset paths
- Social-platform definitions
- Theme configuration
- Utility functions
- Reserved networking space for future API integration

## Project Structure

Only the source and asset folders relevant to the implementation are shown below. Generated Flutter, Android, iOS, and build directories are omitted.

```text
lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   │   ├── app_assets.dart
│   │   └── social_list.dart
│   │
│   ├── network/
│   │
│   ├── theme/
│   │   └── app_theme.dart
│   │
│   └── utils/
│       └── openLink.dart
│
└── features/
    └── smart_post/
        ├── controllers/
        │   ├── smart_post_controller.dart
        │   ├── share_preparation_controller.dart
        │   │
        │   └── states/
        │       ├── smart_post_state.dart
        │       └── share_preparation_state.dart
        │
        ├── data/
        │   ├── models/
        │   │   ├── product.dart
        │   │   ├── recommended_song.dart
        │   │   ├── smart_post.dart
        │   │   ├── smart_post_status.dart
        │   │   └── social_platforms.dart
        │   │
        │   └── testData/
        │       └── smartPostTestData.dart
        │
        └── presentation/
            ├── screens/
            │   ├── smart_posts_screen.dart
            │   └── edit_caption_screen.dart
            │
            └── widgets/
                ├── smart_post_header.dart
                ├── header_action_btn.dart
                ├── top_navigation_label.dart
                ├── smart_post_slide.dart
                ├── creator_banner.dart
                ├── vertical_page_indicator.dart
                ├── post_content_panel.dart
                ├── product_card.dart
                ├── recommended_song_card.dart
                ├── caption_card.dart
                ├── quick_share_bar.dart
                ├── smart_post_bottom_navigation.dart
                ├── color_container.dart
                ├── sales_link_loading_overlay.dart
                │
                ├── intro_dialog/
                │   ├── generation_dialog.dart
                │   ├── generation_step_status.dart
                │   └── generation_step_tile.dart
                │
                └── share_dialog/
                    ├── share_preparation_overlay.dart
                    ├── share_loading_card.dart
                    └── animated_progress_bar.dart
```

```text
assets/
├── app_icon.png
├── icons/
├── images/
└── logo/
    └── social/
```

## Logical Component Breakdown

The main interface is broken into components according to visual responsibility and behaviour rather than creating one large screen widget.

```text
SmartPostsScreen
├── SmartPostHeader
│   ├── HeaderActionBtn
│   └── TopNavigationLabel
│
├── Smart Post generation state
│   └── GenerationDialog
│       └── GenerationStepTile
│
├── SmartPostSlide
│   ├── Background image and readability overlay
│   ├── CreatorBanner
│   ├── VerticalPageIndicator
│   └── PostContentPanel
│       ├── ProductCard
│       ├── RecommendedSongCard
│       ├── CaptionCard
│       └── QuickShareBar
│
├── SmartPostBottomNavigation
│
├── SharePreparationOverlay
│   └── ShareLoadingCard
│       └── AnimatedProgressBar
│
└── EditCaptionScreen
```

### Main screen

`smart_posts_screen.dart` composes the overall screen. It observes Riverpod state and decides whether to show the generation experience, generated posts, or an error state.

### Header

`smart_post_header.dart` contains the brand area, assistant action, camera action, and top navigation. Smaller header-only widgets remain separate where they improve readability and reuse.

### Smart Post slide

`smart_post_slide.dart` builds one carousel page. It combines the post background image with overlapping content such as the creator banner, page indicator, and bottom content panel.

A `PageView` is used for switching between generated post options.

### Post content panel

`post_content_panel.dart` groups the content displayed over the post image:

- Product promotion
- Recommended song
- Caption suggestion
- Referral information
- Quick-share actions

Each section has its own widget because it has an independent visual responsibility.

### Caption editor

`edit_caption_screen.dart` owns its `TextEditingController` and keyboard focus. The final saved caption is returned to the Smart Post flow and applied through the controller.

Temporary typing state remains local to the screen instead of updating global state on every keystroke.

### Generation flow

The generation dialog displays four sequential preparation steps. Each step can be pending, active, or completed.

The controller owns the current step while the widgets are responsible only for rendering and animating the state.

### Share-preparation flow

The share overlay presents a four-stage preparation sequence:

1. Generating the sales link
2. Copying the caption
3. Saving the content
4. Preparing the content for social media

A full-screen `BackdropFilter` blurs and dims the existing interface while the non-dismissible loading card remains in focus.

## State Management

Riverpod is used to keep application state outside the widget tree.

The main data flow is:

```text
Widget watches provider
        ↓
User performs an action
        ↓
Widget calls a controller method
        ↓
Controller creates a new immutable state
        ↓
Riverpod rebuilds the affected widgets
```

Examples of controller-owned state include:

- Smart Post generation status
- Completed generation steps
- Generated post collection
- Selected carousel index
- Caption expansion
- Edited captions
- Share-preparation step and progress

Examples of state intentionally kept inside widgets include:

- `PageController`
- `TextEditingController`
- `FocusNode`
- Animation controllers used only by one visual component

This separation prevents UI lifecycle objects from leaking into application state.

## Running the Project

### Prerequisites

Install the following:

- Flutter SDK
- Dart SDK, included with Flutter
- Android Studio or VS Code with the Flutter extension
- Android emulator, iOS simulator, or a physical device
- Xcode when running on iOS

Confirm that Flutter is configured correctly:

```bash
flutter doctor
```

### Clone and run

```bash
git clone <repository-url>
cd brandie_smart_posts
flutter pub get
flutter run
```

Select a device when prompted, or list available devices with:

```bash
flutter devices
```

Run on a specific device:

```bash
flutter run -d <device-id>
```

### Running with FVM

Using FVM is recommended when the repository contains a committed `.fvmrc`, because it ensures every reviewer uses the same Flutter SDK version.

```bash
fvm install
fvm flutter pub get
fvm flutter run
```

Check the project Flutter version with:

```bash
fvm flutter --version
```

### Analyse and format

```bash
flutter analyze
dart format .
```

With FVM:

```bash
fvm flutter analyze
fvm dart format .
```

### Build an Android APK

```bash
flutter build apk --release
```

With FVM:

```bash
fvm flutter build apk --release
```

The generated APK is normally available at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Assumptions

The following assumptions were made while interpreting the design:

1. **Frontend-only scope**  
   The assignment prioritises frontend implementation. Product generation, caption generation, referral-link generation, and content preparation are therefore simulated locally.

2. **Mock content**  
   The three Smart Posts are provided through local test data rather than a backend API.

3. **In-memory state**  
   Edited captions and generated state are stored in memory and reset when the application restarts.

4. **Primary mobile layout**  
   The interface is designed primarily for portrait mobile screens. Responsive constraints and scrollable content are used to reduce overflow on shorter devices.

5. **Navigation scope**  
   Smart Post is the primary implemented feature. Other top-navigation and bottom-navigation destinations are represented visually but are outside the assignment's functional scope.

6. **Social integrations**  
   Social-platform actions demonstrate the intended interaction. Full Instagram, Facebook, TikTok, and other native SDK integrations are not included because they require platform-specific credentials and production configuration.

7. **Local design assets**  
   Images, logos, and social icons are bundled locally so the demonstration does not depend on network availability.

8. **Generation timing**  
   Loading durations are intentionally simulated to demonstrate the designed intermediate states. In a production implementation, progress would be driven by actual asynchronous operations.

## Custom Improvements

The following improvements were added where the design did not define complete behaviour:

- Sequential animated Smart Post generation steps
- Clear pending, active, and completed generation states
- Smooth transition from loading state to generated posts
- Swipeable post selection using `PageView`
- Responsive content constraints for different mobile heights
- Expandable caption behaviour
- Dedicated full-screen caption editor
- Save-state handling for caption changes
- Four-stage share-preparation animation
- Full-screen blurred and dimmed modal background
- Animated progress movement between share stages
- Local assets for a stable offline presentation
- Separation of temporary UI controllers from Riverpod application state
- Centralised theme and asset definitions
- Reusable visual components instead of one monolithic screen widget

## Design Decisions

### Feature-first organisation

All Smart Post code is kept inside `features/smart_post`. This keeps controllers, state, models, screens, and widgets for the feature close together and avoids mixing unrelated application files in global folders.

### Lightweight layering

The project includes only the layers that provide value for the assignment. A repository and API layer can be added later, but creating empty abstractions for a mock-data frontend would add complexity without improving the demonstration.

### Model-driven widgets

Post content is passed into widgets through models rather than hardcoded directly inside the UI. This makes the widgets reusable and allows mock data to be replaced with API data later.

### State-driven animations

The loading interfaces are driven by controller state. Widgets animate when the step or progress value changes rather than controlling the workflow themselves.

### Controlled use of `Stack`

`Stack` is used only for elements that genuinely overlap, such as content displayed over a post image and full-screen modal overlays. Standard `Row`, `Column`, `Expanded`, and constraint-based layouts are used elsewhere.

## Production Extensions

With additional time and backend access, the next steps would be:

- Connect the generation flow to real APIs
- Add repository and remote data-source layers
- Persist edited captions and generated posts
- Integrate platform-specific social sharing
- Generate a shareable image from the Smart Post
- Add authentication and user-specific referral data
- Add analytics and share-event tracking
- Add localisation
- Add unit, widget, and golden tests
- Add offline caching and retry policies
- Expand the remaining navigation destinations

## Repository Hygiene

Generated and machine-specific folders should not be committed:

```text
.dart_tool/
build/
android/.gradle/
android/local.properties
.idea/workspace.xml
```

The project should commit source code, assets, `pubspec.yaml`, `pubspec.lock`, and `.fvmrc` when FVM is used.

## Assignment Scope

This project was built to demonstrate:

- Accurate translation of a supplied Figma design
- Clean Flutter and Dart code
- Logical component decomposition
- Reusable styling and widgets
- State management with Riverpod
- Responsive UI decisions
- Thoughtful handling of undefined interactions
