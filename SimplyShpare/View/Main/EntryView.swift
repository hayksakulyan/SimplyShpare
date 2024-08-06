//
//  EntryView.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 09.07.24.
//

import SwiftUI
import Combine

struct EntryView: View {
    
    let isAvtive: Bool
    let category: String
    let pencil: String = "Pencil"
    @State private var isPresented: Bool = false
    @State var selectedEntry: Categories? = nil
    @ObservedObject var entryViewModel: EntryViewModel
    
    var body: some View {
        
        HStack {
            Text(category)
                .font(.system(size: 28, weight: .bold))
                .lineLimit(1)
                .padding(.trailing, 15)
            Image(pencil)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    //MARK: for editing Category
                    if let entry = entryViewModel.categoryArr.first(where: { $0.category == category }) {
                        selectedEntry = entry
                        isPresented.toggle()
                        
                    }
                }
        }
        .padding(EdgeInsets(top: 13, leading: 13, bottom: 13, trailing: 13))
        .background(isAvtive ? Color.white : Color.clear)
        .cornerRadius(14, corners: .allCorners)
        
        .sheet(item: $selectedEntry,
               onDismiss: didDismiss) { detail in
            if #available(iOS 16.0, *) {
                EditView(category: detail.category, amount: String(detail.amount), id: detail.id, entryViewModel: entryViewModel)
                    .padding(.top, 30)
                    .presentationDetents([.large, .medium, .fraction(0.6)])
                    .onTapGesture {
//                        didDismiss()
                    }
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    func didDismiss() {
            
        }
}

//
//#Preview {
//    Main()
//}
