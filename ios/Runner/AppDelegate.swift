import UIKit
import Flutter
import GoogleMaps  // Добавьте этот import

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        // TODO: Добавьте Ваш Google Maps API ключ
    GMSServices.provideAPIKey("AIzaSyBXIhC-6wUDIh8XWRSPMzDG9tdgwjDZtFI")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
