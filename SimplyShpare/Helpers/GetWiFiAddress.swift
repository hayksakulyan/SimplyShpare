//
//  GetWiFiAddress.swift
//  SimplyShpare
//
//  Created by Hayk Sakulyan on 24.07.24.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

func getWiFiAddress() -> String? {
    var address: String?
    
    // Get list of all interfaces on the device
    var ifaddr: UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return nil }
    guard let firstAddr = ifaddr else { return nil }
    
    // Iterate through the interfaces
    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let interface = ptr.pointee
        
        // Check for IPv4 interface
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
            
            // Check if interface is Wi-Fi
            let name = String(cString: interface.ifa_name)
            if name == "en0" {
                
                // Convert interface address to a human readable string
                var addr = interface.ifa_addr.pointee
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname, socklen_t(hostname.count),
                            nil, socklen_t(0), NI_NUMERICHOST)
                address = String(cString: hostname)
            }
        }
    }
    freeifaddrs(ifaddr)
    
    return address
}


