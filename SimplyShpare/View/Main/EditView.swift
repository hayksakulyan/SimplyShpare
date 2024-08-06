//
//  EditView.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 16.07.24.
//

import SwiftUI

struct EditView: View {
    
    @State var category: String = ""
    @State var amount: String = ""
    @State var id = UUID()
    
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
                
                HStack {
                    Text("It remains to save up")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("$ \(balance)")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                }
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color("HeaderButtonColor"))
                            .frame(height: 54)
                            .cornerRadius(14, corners: .allCorners)
                        Text("Save")
                            .foregroundColor(.white)
                            .font(Font.system(size: 17, weight: .bold))
                        
                    }
                    //MARK: Edit selected item in array of categories
                    .onTapGesture {
                        //MARK: need to change optional default value
                        
                        entryViewModel.editItem(newCategory: category, newAmount: Int(amount) ?? 0, id: id)
 
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 54)
                            .cornerRadius(14, corners: .allCorners)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("HeaderButtonColor"), lineWidth: 2)
                            )
                        Text("Delete")
                            .foregroundColor(Color("HeaderButtonColor"))
                            .font(Font.system(size: 17, weight: .bold))
                        
                    }
                    //MARK: Delete selected item from array of categories
                    .onTapGesture {
                        entryViewModel.deleteItem(id: id)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .padding(.top, 16)
                
                
            }
            .padding(.horizontal, 10)
            
        }
    }
}

//#Preview {
//    Main()
//    //    EditView(entryViewModel: EntryViewModel())
//}
