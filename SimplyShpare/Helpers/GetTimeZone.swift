//
//  GetTimeZone.swift
//  SimplyShpare
//
//  Created by Hayk Sakulyan on 24.07.24.
//

import Foundation

func getFormattedTimeZone() -> String {
    let timeZone = TimeZone.current
    let identifier = timeZone.identifier
    let timeZoneAbbreviation = timeZone.abbreviation()

    // Split the identifier into components
    let components = identifier.split(separator: "/")
    
    // Join components to form a more readable format
    if components.count == 2 {
        let continent = components[0].replacingOccurrences(of: "_", with: " ")
        let city = components[1].replacingOccurrences(of: "_", with: " ")
        return "\(continent), \(city) \(timeZoneAbbreviation ?? "")"
    } else {
        return identifier
    }
}
