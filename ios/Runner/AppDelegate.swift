import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyCVsjaV8MQ6mR9ee9V0ie5K2Lohp_7m3MA") // Add this line
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
