//
//  Example.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 10.07.24.
//

import SwiftUI
import Combine

//struct Item: Identifiable {
//    var id = UUID()
//    var name: String
//}
//
//struct Category: Identifiable {
//    var id = UUID()
//    var name: String
//    var items: [Item]
//}
//class CategoryViewModel: ObservableObject {
//    @Published var categories: [Category] = [
//        Category(name: "Work", items: [Item(name: "Meeting"), Item(name: "Report")]),
//        Category(name: "Personal", items: [Item(name: "Grocery Shopping"), Item(name: "Exercise")])
//    ]
//
//    @Published var selectedCategory: Category?
//    @Published var selectedItem: Item?
//}
//
//struct Example: View {
//    @StateObject private var viewModel = CategoryViewModel()
//        @State private var showingEditSheet = false
//
//    var body: some View {
//
//        NavigationView {
//                    List {
//                        ForEach(viewModel.categories) { category in
//                            Section(header: Text(category.name)) {
//                                ForEach(category.items) { item in
//                                    HStack {
//                                        Text(item.name)
//                                        Spacer()
//                                        Button(action: {
//                                            viewModel.selectedCategory = category
//                                            viewModel.selectedItem = item
//                                            showingEditSheet = true
//                                        }) {
//                                            Image(systemName: "pencil")
//                                        }
//                                        .buttonStyle(BorderlessButtonStyle())
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    .navigationTitle("Categories")
//                    .sheet(isPresented: $showingEditSheet) {
//                        if let selectedCategory = viewModel.selectedCategory,
//                           let selectedItem = viewModel.selectedItem {
//                            EditItemView(viewModel: viewModel, category: selectedCategory, item: selectedItem)
//                        }
//                    }
//                }
//
//    }
//}
//struct EditItemView: View {
//    @ObservedObject var viewModel: CategoryViewModel
//    @State private var item: Item
//    @Environment(\.presentationMode) private var presentationMode
//    var category: Category
//
//    init(viewModel: CategoryViewModel, category: Category, item: Item) {
//        self.viewModel = viewModel
//        self.category = category
//        _item = State(initialValue: item)
//    }
//
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Item Name", text: $item.name)
//            }
//            .navigationTitle("Edit Item")
//            .navigationBarItems(leading: Button("Cancel") {
//                presentationMode.wrappedValue.dismiss()
//            }, trailing: Button("Save") {
//                if let categoryIndex = viewModel.categories.firstIndex(where: { $0.id == category.id }),
//                   let itemIndex = viewModel.categories[categoryIndex].items.firstIndex(where: { $0.id == item.id }) {
//                    viewModel.categories[categoryIndex].items[itemIndex] = item
//                }
//                presentationMode.wrappedValue.dismiss()
//            })
//        }
//    }
//}
//
//#Preview {
//    Example()
//}
