// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "InfobipMobileMessaging",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "InfobipMobileMessaging",
            targets: ["MobileMessaging", "MobileMessagingObjC"]),
        .library(name: "InAppChat", targets: ["InAppChat"]),
        .library(name: "WebRTCUI", targets: ["WebRTCUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT/Swift-JWT.git", from: "4.0.0"),
        .package(url: "https://github.com/infobip/infobip-rtc-ios/infobip-rtc-ios.git", from: "2.0.20")
    ],
    targets: [
        .target(
            name: "MobileMessaging",
            dependencies: ["MobileMessagingObjC"],
            path: "Classes/MobileMessaging",
            resources: [
//                .process("Resources/InteractiveNotifications/PredefinedNotificationCategories.plist"),
                .process("Resources")
            ]
        ),
        .target(
            name: "MobileMessagingObjC",
            path: "Classes/MobileMessagingObjC",
            exclude: ["Core/Plugins/MobileMessagingPluginApplicationDelegate.m", "Headers/MobileMessagingPluginApplicationDelegate.h"],
            publicHeadersPath: "Headers"
        ),
        /// InAppChat
        .target(
            name: "InAppChat",
            dependencies: [
                "MobileMessaging",
                .product(name: "SwiftJWT", package: "Swift-JWT")
            ],
            path: "Classes/Chat",
            resources: [.copy("Resources/ChatConnector.html"), .process("Resources/MobileMessagingChatImages.xcassets")]
        ),
        /// WebRTCUI
        .target(
            name: "WebRTCUI",
            dependencies: [
                "MobileMessaging",
                .product(name: "InfobipRTC", package: "infobip-rtc-ios"),
            ],
            path: "Classes/WebRTCUI",
            resources: [.process("Resources")],
            cSettings: [.define("WEBRTCUI_ENABLED")],
            swiftSettings: [.define("WEBRTCUI_ENABLED")]
        ),
        /// Support Target
        .target(
            name: "ChatLogging",
            dependencies: [
                "CocoaLumberjack", "MobileMessaging"
            ],
            path: "Classes/Logging"
        ),
    ]
)
