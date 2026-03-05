# PulseStock

PulseStock is a SwiftUI real-time stock tracker built with MVVM, Combine, and WebSocket streaming.
It simulates live updates for 25 stock symbols and displays updates across a feed and detail screen.

## Features

- Real-time stock feed with **25 symbols**
- Updates streamed every **2 seconds**
- WebSocket echo integration via Postman Echo
- Feed sorted by highest current price
- Start/Stop live feed control
- Connection status indicator in top bar
- Symbol detail screen with live value updates
- Price direction indicators (up/down)
- Row flash animation when price changes
- Deep link support (`stocks://symbol/{SYMBOL}`)
- Dark mode support
- Unit, performance, and UI test targets

## Tech Stack

- SwiftUI
- Combine
- URLSessionWebSocketTask
- XCTest / XCUITest
- NavigationStack + Coordinator-style navigation

## Project Structure

```text
PulseStock/
├── PulseStock/
│   ├── App/
│   ├── Core/
│   │   ├── Constant/
│   │   ├── Model/
│   │   ├── Navigation/
│   │   ├── Networking/
│   │   ├── Services/
│   │   └── Utilities/
│   ├── Features/
│   │   └── Feed/
│   │       ├── View/
│   │       └── VIewModel/
│   └── Resources/
├── PulseStockTests/
└── PulseStockUITests/
```

## Requirements

- Xcode 26.2+
- iOS deployment target: 18.6
- Swift 5

## Setup

1. Open project:
   - `PulseStock.xcodeproj`
2. Select scheme:
   - `PulseStock`
3. Run on simulator or physical device.

## Run from Terminal

```bash
xcodebuild -project PulseStock.xcodeproj \
  -scheme PulseStock \
  -configuration Debug \
  -destination 'generic/platform=iOS' \
  CODE_SIGNING_ALLOWED=NO build
```

## Tests

Run all tests:

```bash
xcodebuild test \
  -project PulseStock.xcodeproj \
  -scheme PulseStock \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```

Run only unit tests:

```bash
xcodebuild test \
  -project PulseStock.xcodeproj \
  -scheme PulseStock \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -only-testing:PulseStockTests
```

## WebSocket Flow

1. App connects to `wss://ws.postman-echo.com/raw`
2. Service generates per-symbol updates every 2 seconds
3. Symbol/price payloads are sent to socket
4. Echoed payloads are parsed and applied to the in-memory stock list
5. Feed and details update reactively through Combine publishers

## Deep Linking

Supported URL scheme is configured in `Info.plist`:

- `stocks://symbol/AAPL`

Example command:

```bash
xcrun simctl openurl booted stocks://symbol/AAPL
```

## Notes

- `PulseStockTests` includes model, constants, view model, and performance tests.
- `PulseStockUITests` contains base launch/UI test scaffolding.
- If your local Xcode/simulator version differs, update destination and deployment target settings accordingly.
