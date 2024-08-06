//
//  FollowView.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI

struct FollowView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var backgroundIMG: String = "EnableNotofication"
    @State var backgroundColor: String = "OnbUserColorBack"
    @State var dismissBtnIMG: String = "BtnX"
    @State var btnName: String = "Enable Notification"
    @State var NotifBtnColor: String = "NotifBtnColor"
    
    
    var body: some View {
        ZStack {
            Image("\(backgroundIMG)")
                .resizable()
                .background(Color("\(backgroundColor)"))
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Button(action: {
                            // MARK: close Telegram Join action
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Circle()
                                .frame(width: 30, height: 30)
                            
                        })
                        .foregroundColor(Color.white)
                        
                        Image("\(dismissBtnIMG)")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.black)
                            
                    }
                }
                .padding(.trailing, 16)
                .padding(.top, 22)
                
                Spacer()
                ZStack {
                    Rectangle()
                        .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                        .ignoresSafeArea(.all)
                        .foregroundColor(.white)
                        .frame(height: 136)
                    
                    
                    Button(action: {
                        //
                        
                    }) {
                        HStack {
                            
                            Text("\(btnName)")
                                .font(Font.system(size: 16))
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding(EdgeInsets(top: 43, leading: 15, bottom: 43, trailing: 15))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color(NotifBtnColor))
                        .cornerRadius(10)
                        
                    }
                    .padding(EdgeInsets(top: 43, leading: 15, bottom: 43, trailing: 15))
                }
            }
            //
        }
    }
}

#Preview {
    FollowView()
}
