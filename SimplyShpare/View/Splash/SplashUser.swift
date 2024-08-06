//
//  SplashUser.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI
import Network
import CoreTelephony

struct SplashUser: View {
    
    @State private var isActive = false
    @State private var percent: Int = 1
    @State private var timer: Timer?
    
    
    var body: some View {
        if isActive {
            OnboardingUser()
            
        } else {
            ZStack {
                Color("LoadingVebViewBack")
                    .ignoresSafeArea(.all)
                VStack {
                    Image("LoadingVebViewLogo")
                        .resizable()
                        .frame(width: 170, height: 245)
                    //                    .padding(EdgeInsets(top: 272, leading: 110, bottom: 327, trailing: 110))
                    HStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                        
                        Text("\(percent)%")
                            .foregroundColor(Color.white)
                            .padding(.leading, 4)
                    }
                    .padding(.top, 44)
                }
            }
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    withAnimation {
                        percent += 1
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                    stopIncrementing()
                }
            
                print(UIDevice.current.name)
                print("VPN \(VpnChecker.isVpnActive())")
                let idfv = UIDevice.current.identifierForVendor?.uuidString
                print("IDFV: \(idfv ?? "unknown")")
                if let ipAddress = getWiFiAddress() {
                    print("WiFi IP Address: \(ipAddress)")
                } else {
                    print("WiFi IP Address not found")
                }
                // Setup the Network Info and create a CTCarrier object
                let networkInfo = CTTelephonyNetworkInfo()
                let carrier = networkInfo.subscriberCellularProvider

                // Get carrier name
                let carrierName = carrier?.carrierName
                print(carrierName ?? "Ther isn't information about Network provider")
                let systemVersion = UIDevice.current.systemVersion
                print("iOS Version: \(systemVersion)")
                
                let currentLocale = Locale.current
                let languageCode = currentLocale.languageCode
                let languageName = currentLocale.localizedString(forLanguageCode: languageCode ?? "")

                print("Language code: \(languageCode ?? "Unknown")")
                print("Language name: \(languageName ?? "Unknown")")


                let currentTimeZone = TimeZone.current
                let timeZoneIdentifier = currentTimeZone.identifier
                let timeZoneAbbreviation = currentTimeZone.abbreviation()
                let timeZoneOffset = currentTimeZone.secondsFromGMT()

                print("Time zone identifier: \(timeZoneIdentifier)")
                print("Time zone abbreviation: \(timeZoneAbbreviation ?? "Unknown")")

//                let formattedTimeZone = getFormattedTimeZone()
//                print("Formatted time zone: \(formattedTimeZone)")
                
                print("Is charging \(checkBatteryState())")
                
                print("Memory Size \(getTotalMemory()) GB")
                
                
                
            }
        }
        
        
    }
    
    
    func stopIncrementing() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    SplashUser()
}
