//
//  Header.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 04.07.24.
//

import SwiftUI

struct Header: View {
    
    @State var headerText: String
    
    var body: some View {
        
        
        ZStack(alignment: .bottomLeading) {
            ZStack {
                Rectangle()
                    .fill(Color("MainColor"))
                    .frame(height: 150)
                    .overlay(
                        Circle()
                            .frame(width: 800, height: 800)
                            .offset(x: -170, y: -290)
                            .foregroundColor(Color("Circle1"))
                            .mask(
                                Rectangle()
                                    .frame(height: 150)
                                    .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
                            )
                    )
                    .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
                    .overlay(
                        Circle()
                            .frame(width: 800, height: 800)
                            .offset(x: 280, y: 410)
                            .foregroundColor(Color("Circle2"))
                            .mask(
                                Rectangle()
                                    .frame(height: 150)
                                    .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
                            )
                    )
                    .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
            }
            Text("\(headerText)")
                .font(Font.system(size: 34, weight: .bold))
                .foregroundColor(.white)
                .padding([.leading, .bottom], 20)
        }
        
    }
}


#Preview {
    Header(headerText: "Home")
}
