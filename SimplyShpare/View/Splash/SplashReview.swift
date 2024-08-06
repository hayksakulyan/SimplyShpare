
import SwiftUI

struct SplashReview: View {
    
    @State private var isActive = false
    @State private var percent: Int = 1
    @State private var timer: Timer?
    private let onboardingReviewSteps = [
        OnboardingStepReview(text: "Convenient \nfunctionality and ease of learning", image: "OnbReviewBackIMG1"),
        OnboardingStepReview(text: "The ability to edit and \ndelete a record at any \ntime", image: "OnbReviewBackIMG2"),
        OnboardingStepReview(text: "Creating calculations \nwith the ability to \nmanage records", image: "OnbReviewBackIMG3")
    ]
    var body: some View {
        
        if isActive {
            OnboardingReview(onboardingSteps: onboardingReviewSteps)
            
        } else {
            
            ZStack {
                
                VStack {
                    Image("OnboardingReviewBack")
                        .resizable()
                        .ignoresSafeArea(.all)
                }
                VStack {
                    Image("ReviewBackLogo")
                        .resizable()
                        .frame(width: 250, height: 260)
                        .padding(EdgeInsets(top: 278, leading: 70, bottom: 306, trailing: 70))
                }
                
                ZStack {
                    HStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                        
                        Text("\(percent)%")
                            .foregroundColor(Color.white)
                            .padding(.leading, 4)
                    }
                }
                .padding(.top, 290)
                
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
     
            }
        }
    }
    func stopIncrementing() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    SplashReview()
}
