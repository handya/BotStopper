# BotStopper
[![SwiftLint](https://github.com/handya/BotStopper/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/handya/BotStopper/actions/workflows/swiftlint.yml) [![Tests](https://github.com/handya/BotStopper/actions/workflows/tests.yml/badge.svg)](https://github.com/handya/BotStopper/actions/workflows/tests.yml)

Bot stopper is a simple proof of concept vapor package to detect bots using the user agent header and a list of bots from [COUNTER-Robots](https://github.com/atmire/COUNTER-Robots)


### Usage 
Add the package to your project and get the latest bot list from [COUNTER-Robots](https://github.com/atmire/COUNTER-Robots)

Setup: 
```swift
 app.botStopper.configuration = try .init(path: app.directory.resourcesDirectory)
 ```

Use: 
```swift
    func view(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        try req.botStopper.stop()
     	...
```

if Bot Stopper detect a bot user agent it will throw a 405 error.


```swift
[
  {
    "pattern": "bot",
    "last_changed": "2017-08-08"
  },
...
]
```

