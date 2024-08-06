//
//  BatteryStatus.swift
//  SimplyShpare
//
//  Created by Hayk Sakulyan on 24.07.24.
//

import Foundation
import UIKit

func checkBatteryState() -> Bool{
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    
//    switch device.batteryState {
//    case .unknown:
//        print("Battery state is unknown.")
//    case .unplugged:
//        print("Device is not charging.")
//    case .charging:
//        print("Device is charging.")
//    case .full:
//        print("Device is fully charged.")
//    @unknown default:
//        print("An unknown battery state.")
//    }
    let isCharging = device.batteryState == .charging
    return isCharging
}
