//
//  HideKeyboard.swift
//  SimplyShpare
//
//  Created by Hayk Sakulyan on 25.07.24.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
