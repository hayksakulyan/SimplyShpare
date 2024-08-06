//
//  AppDelegate.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 02.07.24.
//

import Foundation
import UIKit
import AppMetricaCore
import ApphudSDK
import OneSignalFramework

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    private let appHudApiKey: String = "app_hphaJPniFpaa12rUBmwJhDe5iEwQwi"
    private let appMetricaApiKet: String = "2c981b40-c189-4bd7-a160-6bf81bade19f"
    private let oneSignalKey:String = "SNA3XS75QN"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        Apphud.start(apiKey: appHudApiKey)
        
        let configuration = AppMetricaConfiguration(apiKey: appMetricaApiKet)
            AppMetrica.activate(with: configuration!)
        
        OneSignal.initialize(oneSignalKey, withLaunchOptions: launchOptions)
        
        return true
    }
}
