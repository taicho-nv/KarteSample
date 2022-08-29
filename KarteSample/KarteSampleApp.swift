//
//  KarteSampleApp.swift
//  KarteSample
//
//  Created by 今村圭佑 on 2022/08/26.
//

import SwiftUI
import KarteCore

@main
struct KarteSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            KarteSampleView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        KarteApp.setup()
        
        // 本番環境の設定ファイルを読み込む場合
        /*if let plistPath = Bundle.main.path(forResource: "Karte-Production-Info", ofType: "plist"),
           let configuration = Configuration.from(plistPath: plistPath) {
            KarteApp.setup(configuration: configuration)
        }*/
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return KarteApp.application(app, open: url)
    }
}
