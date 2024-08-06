//
//  Main.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import SwiftUI

struct Main: View {
    
    @ObservedObject private var entryViewModel = EntryViewModel()
    @State private var selectedIndex: Int = 0
    @State private var isPresented: Bool = false
    @State private var selectedItem: Categories?

        init(selectedItem: Categories, entryViewModel: EntryViewModel) {
          
            self._selectedItem = State(initialValue: entryViewModel.categoryArr[0])
            self.entryViewModel = entryViewModel
        }
    
    var body: some View {
        
        ZStack {
            Color("MainPageColor")
                .ignoresSafeArea(.all)
            VStack {
                Header(headerText: "Home")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<entryViewModel.categoryArr.count, id: \.self) { entry in
                            EntryView(isAvtive: entry == selectedIndex, category: entryViewModel.categoryArr[entry].category, entryViewModel: entryViewModel)
                            
                                .onTapGesture {
                                    selectedIndex = entry
                                    selectedItem = entryViewModel.categoryArr[selectedIndex]
                                    
//                                    print(selectedItem?.category ?? "zibil")
                                }
                                
                            
                        }
                    }
                }
                .padding(.leading, 5)
                Diagramm(entryViewModel: entryViewModel, selectedItem: $selectedItem)
                    .padding(.top, 1)
                
                AddEntry(viewModel: entryViewModel)
//                Example(entryViewModel: entryViewModel)
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
//    Main(selectedItem: Categories.init(category: "", amount: 12), entryViewModel: EntryViewModel())
    Main(selectedItem: Categories(category: "", amount: 1), entryViewModel: EntryViewModel())
}
