//
//  OnboardingUser.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI

struct OnboardingStepUser {
    let text: String
    let image: String
}

let onboardingUserSteps = [
    OnboardingStepUser(text: "Show your financial \ngrowth", image: "OnbUserBackIMG1"),
    OnboardingStepUser(text: "Rate our app in the \nAppStore", image: "OnbUserBackIMG2")
]

struct OnboardingUser: View {
    
    @State var onboardingStep: [OnboardingStepUser] = onboardingUserSteps
    @State private var currentStep = 0
    @State private var tapCount = 0
    @State var isTelegramViewPresented: Bool = false
    @State var isFollowViewPresented: Bool = false
    @State var openMainPage: Bool = false
    
    var body: some View {
        
        // MARK: tis boolean is for changing view from onboarding to another
        if openMainPage {
            // MARK: ------------------------------------------------------
            CustomTabView()
//            Main(selectedItem: Categories(category: "", amount: 1), entryViewModel: EntryViewModel())
        } else {
        TabView(selection: $currentStep) {
            ForEach(0..<onboardingStep.count, id: \.self) { item in
                ZStack {
                    if #available(iOS 16, *) {
                        Image(onboardingStep[item].image)
                            .resizable()
//                            .background(Color("OnbUserColorBack"))
                            .foregroundStyle(Color("OnbUserColorBack"))
                            .ignoresSafeArea(.all)
                    } else {
                        Image(onboardingStep[item].image)
                            .resizable()
                            .background(Color("OnbUserColorBack"))
                            .ignoresSafeArea(.all)
                    }
                    Image(onboardingStep[item].image)
                        .resizable()
                        .background(Color("OnbUserColorBack"))
                        .ignoresSafeArea(.all)
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                                .ignoresSafeArea(.all)
                                .foregroundColor(.white)
                                .frame(height: 304)
                            VStack {
                                Text(onboardingStep[item].text)
                                    .font(Font.system(size: 24))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color("TextColor"))
                                    .padding(EdgeInsets(top: 47, leading: 43, bottom: 16, trailing: 43))
                                HStack {
                                    ForEach(0..<onboardingStep.count, id: \.self) { point in
                                        if point == currentStep {
                                            Circle()
                                                .frame(width: 8, height: 8)
                                                .foregroundColor(Color("CircleColor1"))
                                        } else {
                                            Circle()
                                                .frame(width: 8, height: 8)
                                                .foregroundColor(Color("CircleColor2"))
                                        }
                                    }
                                }
                                HStack {
                                    Button(action: {
                                        if self.currentStep < onboardingStep.count - 1  {
                                            self.currentStep += 1
                                        } else {
                                            if tapCount == 0 {
                                                RequestReview.requestReview()
                                            } else if tapCount == 1 {
                                                
                                                isTelegramViewPresented = true
                                                //MARK: var above is changing his value inside body of dismissing first sheet
                                                //isFollowViewPresented = true
                                            } else {
                                                //
                                            }
                                            tapCount += 1
                                        }
                                    }) {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 17))
                                            .fontWeight(.bold)
                                            .frame(height: 50)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(10)
                                            .background(Color.blue)
                                            .cornerRadius(16, corners: .allCorners)
                                    }
                                    .padding(EdgeInsets(top: 16, leading: 15, bottom: 65, trailing: 15))
                                }
                            }
                        }
                    }
                }
                .tag(item)
            }
        }
        //MARK: Open Telegram Join Page
        .fullScreenCover(isPresented: $isTelegramViewPresented, onDismiss: {
            isFollowViewPresented = true
        }) {
            TelegramView()
        }
        .fullScreenCover(isPresented: $isFollowViewPresented, onDismiss: {
            openMainPage = true
        }) {
            FollowView()
        }
        .ignoresSafeArea(.all)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
    }
}

#Preview {
    OnboardingUser(onboardingStep: onboardingUserSteps)
}
