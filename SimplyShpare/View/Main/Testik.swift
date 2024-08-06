//
//  Testik.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 17.07.24.
//

import SwiftUI

struct Testik: View {
    
    
    
    var body: some View {
        
        
        ZStack {
            Color.green
                .ignoresSafeArea(.all)
            
            HStack {
                Text("Hello, World!sdsdsdsd")
                Image("Pencil")
            }
            .padding()
        .background(Color.white)
        .cornerRadius(14, corners: .allCorners)
        }
    }
}

#Preview {
    Testik()
}
