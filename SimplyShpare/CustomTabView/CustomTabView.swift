//
//  CustomTabView.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                // Content
                ZStack {
                    switch selectedIndex {
                    case 0:
                        Main(selectedItem: Categories(category: "", amount: 1), entryViewModel: EntryViewModel())
                    case 1:
                        GoalCalculator()
                    default:
                        Settings()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Custom Tab Bar
                HStack {
                    TabBarItem(icon: "Home", isSelected: selectedIndex == 0)
                        .onTapGesture { selectedIndex = 0 }
                    Spacer()
                    TabBarItem(icon: "Star", isSelected: selectedIndex == 1)
                        .onTapGesture { selectedIndex = 1 }
                    Spacer()
                    TabBarItem(icon: "Setting", isSelected: selectedIndex == 2)
                        .onTapGesture { selectedIndex = 2 }
                }
                .padding()
            }
            .ignoresSafeArea(.all)
        }
        .shadow(color: Color("TabViewColor"), radius: 3.7, x: 0, y: -3)
    }
}
struct TabBarItem: View {
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(icon)
            //MARK: for changing png color
                .renderingMode(.template)
                .foregroundColor(isSelected ? .blue : .gray)
                .foregroundColor(isSelected ? .blue : Color("ShadowColorHex25"))
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CustomTabView()
}
