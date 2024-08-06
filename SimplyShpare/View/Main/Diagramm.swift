//
//  Diagramm.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 04.07.24.
//

import SwiftUI

struct Diagramm: View {
    
    var progress: Double = 1.0
    @State private var dolar: String = "Dollar"
    @State private var mainColor: String = "MainColor"
    @ObservedObject var entryViewModel: EntryViewModel
    @Binding var selectedItem: Categories?
    
    var body: some View {
 
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            
            HStack(spacing: screenWidth * 0.015) {
                ZStack {
                    ZStack(alignment: .topTrailing) {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: screenWidth * 0.65)
                            .cornerRadius(14, corners: .allCorners)
                        ZStack {
                            Image(dolar)
                                .resizable()
                                .frame(width: 32, height: 32)
                            .padding([.top, .trailing], 11)
                        }
                    }
                    //MARK: circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 35.0)
                            .foregroundColor(Color(mainColor))
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(progress, 0.39)))
                            .stroke(style: StrokeStyle(lineWidth: 35.0, lineCap: .butt, lineJoin: .round))
                            .foregroundColor(Color("DiagramLightColor"))
                            .rotationEffect(Angle(degrees: -270.0))
                            .animation(.linear)
                        //MARK: this is for percentage
                        //Text(String(format: "%.0f %%", min(progress, 1.0)*100.0))
                        if entryViewModel.categoryArr.isEmpty {
                            VStack {
                                Text("0")
                                    .font(.system(size: 20))
                                Text("0")
                                    .font(.system(size: 20))
                            }
                        } else {
                            ForEach (entryViewModel.categoryArr) { entry in
                                VStack {
                                    
                                    Text(String(min(progress, 1.0)*0.0))
                                        .font(.system(size: 20))
                                    if let selectedItem = selectedItem {
                                        Text(String(selectedItem.amount))
                                            .font(.system(size: 20))
                                    }
                                    
                                }
                            }
                        }
                    }
                    .frame(width: 150, height: 150)
                }
                VStack(spacing: screenHeight * 0.015) {
                    ZStack {
                        ZStack(alignment: .topTrailing) {
                            Rectangle()
                                .fill(Color.white)
                            .cornerRadius(14, corners: .allCorners)
                            ZStack {
                                Image("Pencil")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("MainColor"))
                                    .padding([.top, .trailing], 6)
                            }
                        }
                        
                        ZStack {
                            VStack {
                                ZStack{
                                    Image("Euro")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                    Image("USD")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .offset(x: 15.0, y: 15)
                                }
                                Text("EUR/USD")
                                    .padding(.top, 10)
                            }
                        }
                    }
                    
                    ZStack {
                        
                        Rectangle()
                            .fill(Color("HeaderButtonColor"))
                            .frame(height: screenHeight * 0.24)
                            .cornerRadius(14, corners: .allCorners)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(Font.system(size: 20))
                    }
                    .onTapGesture {
                       //
                        print(selectedItem?.category ?? "zibil from diagramm")
                    }
                }
            }
            .padding(.horizontal, screenWidth * 0.015)
        }
        .frame(height: 244)
    }
}

#Preview {
    Main(selectedItem: Categories(category: "", amount: 1), entryViewModel: EntryViewModel())
//    Diagramm(progress: 2.0)
}
