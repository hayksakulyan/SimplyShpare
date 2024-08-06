//
//  Settings.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 06.07.24.
//

import SwiftUI

struct Settings: View {
    @State private var showWebView = false
    
    private let url: String = "https://www.termsfeed.com/live/69679376-4b12-47c9-abc8-0a8fca1a9fa5"
    
    var body: some View {
        ZStack {
            Color("MainPageColor")
                .ignoresSafeArea(.all)
            VStack {
                Header(headerText: "Settings")
                VStack {
                    SettingComponent(image: "ShareApp", text: "Share App")
                    
                    SettingComponent(image: "RateUs", text: "Rate Us")
                        .onTapGesture {
                            RequestReview.requestReview()
                        }
                    SettingComponent(image: "UsagePolicy", text: "Usage Policy")
                        .onTapGesture {
                            showWebView.toggle()
                        }
                    
                }
                .padding(.top, 15)
                Spacer()
            }
            .sheet(isPresented: $showWebView) {
                        WebView(url: URL(string: "https://www.apple.com")!)
                    .ignoresSafeArea(.all)
                    }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Settings()
}
