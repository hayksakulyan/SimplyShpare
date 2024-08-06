//
//  RateRequest.swift
//  SimpliSphere
//
//  Created by Hayk Sakulyan on 03.07.24.
//

import Foundation
import StoreKit
import SwiftUI


class RequestReview {
    // MARK: Request Rewiew
    static func requestReview() {
        if let windowScene = UIApplication.shared.windows.first?.windowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}
