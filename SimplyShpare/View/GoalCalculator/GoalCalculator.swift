//
//  GoalCalculator.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 06.07.24.
//

import SwiftUI

struct GoalCalcModel: Equatable {
    var amount: String
    var termInMonths: String
    var total: String
}

struct GoalCalculator: View {
    @State private var showEmptyGoal: Bool = false
    
    @State private var isPresented: Bool = false
    @State var amount: String = ""
    @State var termInMonths: String = ""
    @State var total: Int = 0
    @State var padding: Int = 10
    @State var arrayOfGoals: [GoalCalcModel] = [
        //        GoalCalcModel(amount: "1000", termInMonths: "10", total: "100"),
        //        GoalCalcModel(amount: "2000", termInMonths: "20", total: "200")
    ]
    func calculateAmount() -> Double {
        var result: Double = 0.0
        if let amount = Double(amount), let termInMonths = Double(termInMonths), Double(amount) != 0, Double(termInMonths) != 0  {
            result = amount / termInMonths
            
        }
        return result
    }
    var body: some View {
        ZStack {
            Color("MainPageColor")
                .ignoresSafeArea(.all)
            VStack {
                Header(headerText: "Goal Calculator")
                
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            Text("Calculate the cost of your dream")
                                .font(.system(size: 17, weight: .bold))
                            Spacer()
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 10)
                        
                        HStack(spacing: 8) {
                            
                            TextField("The amount", text: $amount)
                                .frame(width: geometry.size.width * 0.6 - 25, height: 54)
                                .keyboardType(.default)
                                .textFieldStyle(PlainTextFieldStyle())
                                .accentColor(.black)
                                .padding(.leading, 10)
                                .background(Color.white)
                                .cornerRadius(16, corners: .allCorners)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(Color.gray)
                                )
                            
                                .onReceive(amount.publisher.collect()) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0)
                                    }
                                    if filtered != newValue {
                                        self.amount = String(filtered)
                                    }
                                }
                            TextField("Therm (in months)", text: $termInMonths)
                                .frame(width: geometry.size.width * 0.4 - 15, height: 54)
                                .keyboardType(.default)
                                .textFieldStyle(PlainTextFieldStyle())
                                .accentColor(.black)
                                .padding(.leading, 10)
                            
                                .background(Color.white)
                                .cornerRadius(16, corners: .allCorners)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(Color.gray)
                                )
                                .onReceive(termInMonths.publisher.collect()) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0)
                                    }
                                    if filtered != newValue {
                                        self.termInMonths = String(filtered)
                                    }
                                }
                        }
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("The amount")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("$ \(amount)")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                            }
                            HStack(spacing: 8) {
                                Text("Therm (in months)")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("\(termInMonths)")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                            }
                            HStack(spacing: 8) {
                                Text("Monthly payment")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("$ \(calculateAmount(), specifier: "%.2f")")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 16)
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color("HeaderButtonColor"))
                                    .frame(height: 54)
                                    .cornerRadius(14, corners: .allCorners)
                                Text("Calculate")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 20))
                            }
                            .onTapGesture {
                                //MARK: some code for calculating

                                arrayOfGoals.append(GoalCalcModel(amount: "\(amount)", termInMonths: "\(termInMonths)", total: "\(calculateAmount())"))
                                //MARK: keyboard hide func call

                                self.hideKeyboard()
                                
                                self.amount = ""
                                self.termInMonths = ""
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 15)
                        
                        VStack {
                            HStack {
                                Text("History")
                                    .font(.system(size: 28, weight: .bold))
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.horizontal, 10)
                            if arrayOfGoals.isEmpty {
                                VStack {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(height: 86)
                                            .foregroundColor(Color.white)
                                        Text("The calculation history is empty")
                                            .foregroundColor(Color.gray)
                                    }
                                }
                                .padding(.horizontal, 10)
                            } else {
                                VStack {
                                    
                                    List() {
                                        
                                        
                                        ForEach(0..<arrayOfGoals.count, id: \.self) { goal in
                                            
                                            if #available(iOS 15.0, *) {
                                                VStack(spacing: 8) {
                                                    HStack {
                                                        Text("The amount")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                        Spacer()
                                                        Text("$ \(arrayOfGoals[goal].amount)")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                    }
                                                    HStack(spacing: 8) {
                                                        Text("Therm (in months)")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                        Spacer()
                                                        Text("\(arrayOfGoals[goal].termInMonths)")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                    }
                                                    HStack(spacing: 8) {
                                                        Text("Monthly payment")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                        Spacer()
                                                        Text("$ \(calculateAmount(), specifier: "%.2f")")
                                                            .font(.system(size: 17))
                                                            .foregroundColor(.gray)
                                                    }
                                                }
                                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                                    Button("Delete") {
                                                        //MARK: Perform delete action
                                                        self.isPresented = true
                                                        
                                                    }
                                                    .tint(.red)
                                                    
                                                }
                                                //MARK: delete goal alert
                                                .alert(isPresented: $isPresented) {
                                                    Alert(
                                                        title: Text("Delete the count"),
                                                        message: Text(""),
                                                        primaryButton: .cancel(
                                                            Text("Close")
                                                                .foregroundColor(Color.white),
                                                            action: {
                                                                
                                                            }
                                                        ),
                                                        secondaryButton: .destructive(
                                                            Text("Delete"),
                                                            action: {
                                                                arrayOfGoals.remove(at: goal)
                                                            }
                                                        )
                                                    )
                                                }
                                            } else {
                                                // Fallback on earlier versions
                                            }
                                        }
                                    }
                                }
                                //MARK: this is for removing default padding
                                .listStyle(PlainListStyle())
                                .padding(.horizontal, 10)
                            }
                            
                        }
                    }
                    
                    
                }
                Spacer()
            }
            .ignoresSafeArea(.all)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    GoalCalculator()
}
