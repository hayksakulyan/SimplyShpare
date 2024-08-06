//
//  OnboardingReview.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI

struct OnboardingStepReview {
    let text: String
    let image: String
}

private let onboardingReviewSteps = [
    OnboardingStepReview(text: "Convenient \nfunctionality and ease of learning", image: "OnbReviewBackIMG1"),
    OnboardingStepReview(text: "The ability to edit and \ndelete a record at any \ntime", image: "OnbReviewBackIMG2"),
    OnboardingStepReview(text: "Creating calculations \nwith the ability to \nmanage records", image: "OnbReviewBackIMG3")
]

struct OnboardingReview: View {
    @State var onboardingSteps: [OnboardingStepReview]
    @State private var currentStep = 0
    @State private var openBlockPage: Bool = false
    
//    init() {
//        UIScrollView.appearance().bounces = false
//    }
    
    var body: some View {
        
        if openBlockPage {
            BlockPage()
        } else {
            TabView(selection: $currentStep) {
                
                ForEach(0..<onboardingSteps.count, id: \.self) { item in
                    
                    ZStack {
                        Image(onboardingSteps[item].image)
                            .resizable()
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
                                    Text(onboardingSteps[item].text)
                                        .font(Font.system(size: 24))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color("TextColor"))
                                        .padding(EdgeInsets(top: 47, leading: 43, bottom: 16, trailing: 43))
                                    
                                    
                                    HStack {
                                        ForEach(0..<onboardingSteps.count, id: \.self) { point in
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
                                    //                                .padding(.top, 16)
                                    
                                    Button(action: {
                                        if self.currentStep < onboardingSteps.count - 1  {
                                            self.currentStep += 1
                                        } 
//                                        else if self.currentStep == onboardingSteps.count - 1 {
//                                            self.openBlockPage.toggle()
//                                            print(openBlockPage)
//                                        } 
                                        else {
                                            //
                                            self.openBlockPage.toggle()
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
                    .tag(item)
                }
            }
            .ignoresSafeArea(.all)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    OnboardingReview(onboardingSteps: onboardingReviewSteps)
}
