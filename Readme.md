## Stock Chart Applicaiton

This application is a combination of native iOS and Flutter. In this application, the API calls are called on the native iOS side and display the results in Flutter.
To communicate between Flutter and native iOS, a `FlutterMethodChannel` is used.

[Demo video url can be found in here.](https://i.imgur.com/zmoBJcN.mp4)

#### Native Screens

![Native Screen 1](https://i.imgur.com/Xb6GgZf.png)

#### Flutter Screens

![Flutter Screen 1](https://i.imgur.com/B4q6N40.png)

![Flutter Screen 2](https://i.imgur.com/l0DbDJG.png)

### Used Packages

#### Native side

There are no extra packages have been used on the native side. Used the Cocoapod package manager tool to integrate the Flutter module into the native application

#### Flutter Side

- Provider - For manage the state across the app
- SfCartesianChart - To draw the chat for stock changes.

### Used APIs

#### Native side

[polygon.io](https://polygon.io/) service is used to fetch the stock data. There are many limitations on this API for the free trial version, such as the maximum number of requests within a minute is 5.
Once created, an account and get a free API key, can be added to the `API.swift` file.

#### Flutter Side

As requested, the data layer is handled from the native side, and no APIs are used on the Flutter side.

### Overoll Comments

1. Didn't pay much attention to the UI on the native side.
2. Didn't pay much attention to the in detail error handling and data validation on both the native and Flutter sides.
3. Didn't pay much attention to detail on the Flutter side chart screen due to the API's limited data availability, and the My Stock page was already decorated well to demonstrate UI development skills.
4. Avoided the test cases due to the time limitation.
