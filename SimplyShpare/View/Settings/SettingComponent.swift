//
//  SettingComponent.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 06.07.24.
//

import SwiftUI

struct SettingComponent: View {
    @State var image: String
    @State var text: String
    var body: some View {
       
            ZStack {
                Rectangle()
                    .frame(height: 100)
                    .clipShape(RoundedCorner(radius: 16, corners: .allCorners))
                    .foregroundColor(Color.white)
                VStack {
                    Image("\(image)")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(text)")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 4)
                }
            }
        
        .padding([.leading, .trailing], 15)
    }
}

#Preview {
    Settings()
}
