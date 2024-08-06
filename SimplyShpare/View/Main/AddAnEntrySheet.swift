//
//  AddAnEntrySheet.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 06.07.24.
//

import SwiftUI

struct AddAnEntrySheet: View {
    @State var category: String = ""
    @State var amount: String = ""
    @State var balance: Int = 0
    @State var firstInput: Bool = false
    @State var secondInput: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var entryViewModel: EntryViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Add a new entry")
                    .font(.system(size: 25, weight: .medium))
//                if !entryViewModel.entryArr.isEmpty {
//
//                    Text(entryViewModel.entryArr[0].category)
//                }
                TextField("Category", text: $category)
                    .frame(height: 54)
                    .keyboardType(.default)
                    .textFieldStyle(PlainTextFieldStyle())
                    .accentColor(.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.white)
                    .padding(.leading, 10)
                    .cornerRadius(16, corners: .allCorners)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.gray)
                    )
                    .onChange(of: category) { newValue in
                        if !newValue.isEmpty {
                            firstInput = true
                        } else {
                            firstInput = false
                        }
                    }
                
                TextField("The amount", text: $amount)
                    .frame(height: 54)
                    .keyboardType(.default)
                    .textFieldStyle(PlainTextFieldStyle())
                    .accentColor(.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .background(Color.white)
                    .padding(.leading, 10)
                    .keyboardType(.numberPad)
                    .cornerRadius(16, corners: .allCorners)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.gray)
                    )
                    .onChange(of: amount) { newValue in
                        if !newValue.isEmpty {
                            secondInput = true
                        } else {
                            secondInput = false
                        }
                    }
                HStack {
                    Text("It remains to save up")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("$ \(balance)")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                }
                ZStack {
                    
                    Rectangle()
                        .fill(firstInput && secondInput ? Color("HeaderButtonColor") : .gray)
                        .frame(height: 54)
                        .cornerRadius(14, corners: .allCorners)
                    Text("Add")
                        .foregroundColor(.white)
                        .font(Font.system(size: 17, weight: .bold))
                }
                .padding(.top, 16)
                .onTapGesture {
                    entryViewModel.addCategories(category: category, amount: Int(amount)!)
                    print(entryViewModel.categoryArr)
                    print(entryViewModel.categoryArr.count)
                    presentationMode.wrappedValue.dismiss()
//                    presentationMode.wrappedValue.dismiss()
//                    if firstInput && secondInput {
//                        //MARK: some actions
//                        //MARK: here above user couldn't enter string because of keyboard type
//                        if Int(amount) != nil {
//                            entryViewModel.entryArr.append(EntryModel(category: category, amount: Int(amount)!))
//                            print(entryViewModel.entryArr[0].category)
//                            print(entryViewModel.entryArr.count)
//
//                            presentationMode.wrappedValue.dismiss()
//
//                        }
//                    }
                    
                }
                
            }
            .padding(.horizontal, 10)
            
        }
    }
}

#Preview {
    AddAnEntrySheet(entryViewModel: EntryViewModel())
}
