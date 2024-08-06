//
//  EntryViewModel.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 09.07.24.
//

import Foundation

class EntryViewModel: ObservableObject {
    
    @Published var categoryArr: [Categories] = [
    Categories(category: "Car", amount: 1000)
    ]
    
    func addCategories(category: String, amount: Int) {
        let newItem = Categories(category: category, amount: amount)
        categoryArr.append(newItem)
    }
    
    func editItem(newCategory: String, newAmount: Int, id: UUID) {
        if let index = categoryArr.firstIndex(where: {$0.id == id}) {
            categoryArr[index].category = newCategory
            categoryArr[index].amount = newAmount
        }
    }
    func deleteItem(id: UUID) {
        if let index = categoryArr.firstIndex(where: {$0.id == id}) {
            categoryArr.remove(at: index)
        }
    }
}
