# Scientific Calc

## Intro:

A clean calculator able to perform simple and more advanced calculations built with Flutter and Dart. 🤩💙

I decided to implement the calculation functionality of the app without the help of third-party packages from pub.dev (cuz sure, why not?).

Probably not the best implementation out there, and there are a few known bugs already 🥲, but i'm welcome to PRs. 🙏


## Functionality:

### State Management

This app uses [stacked architecture](https://pub.dev/packages/stacked) for state management, theming, hooks, dialog services, routing, logging and more.

### Persistence

This app uses [hive_flutter](https://pub.dev/packages/hive) package which uses Hive under the hood for data persistence.

### Responsiveness

The [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) package was the easiest approach to ensure responsiveness and equivalent scaling on different devices.

## Tip:

You can run the stacked_generator and hive_generator simultaneously using
`flutter packages pub run build_runner build --delete-conflicting-outputs`