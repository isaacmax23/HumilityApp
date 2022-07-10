//
//  HumilityAppApp.swift
//  HumilityApp
//
//  Created by user217650 on 6/24/22.
//

import SwiftUI
import FirebaseCore
import Firebase
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}


@main
struct HumilityAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
        //ContentView(appModel: AppViewModel())
            OnBoardingView()
        }
    }
}
