//
//  AddEntry.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 05.07.24.
//

import SwiftUI

struct AddEntry: View {
    @State private var isPresented: Bool = false
    @StateObject  var viewModel: EntryViewModel

    
    var body: some View {
        VStack {
            HStack {
                Text("History")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                Button(action: {
                    // MARK: Some functions
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                })
            }
            .padding(.top, 16)
            
            ZStack {
                Rectangle()
                    .frame(height: 165)
                    .cornerRadius(12, corners: .allCorners)
                    .foregroundColor(Color.white)
                ZStack {
                    VStack {
                        Text("Add a new entry")
                            .font(.system(size: 25, weight: .medium))
                        ZStack {
                            
                            Rectangle()
                                .fill(Color("HeaderButtonColor"))
                                .frame(height: 54)
                                .cornerRadius(14, corners: .allCorners)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(Font.system(size: 25))
                        }
                        .padding(.horizontal, 32)
                        .onTapGesture {
                            isPresented.toggle()
//                            action()
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .sheet(isPresented: $isPresented) {
            if #available(iOS 16.0, *) {
                AddAnEntrySheet(entryViewModel: viewModel)
                    .padding(.top, 30)
                    .presentationDetents([.large, .medium, .fraction(0.6)])
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

#Preview {
    AddEntry(viewModel: EntryViewModel())
}
