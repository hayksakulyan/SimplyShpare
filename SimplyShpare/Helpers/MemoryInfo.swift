//
//  MemoryInfo.swift
//  SimplyShpare
//
//  Created by Hayk Sakulyan on 24.07.24.
//

import Foundation

func getTotalMemory() ->  Double? {
    var size: UInt64 = 0
    var sizeLen = MemoryLayout<UInt64>.size

    // sysctl call to get total memory
    let mib: [Int32] = [CTL_HW, HW_MEMSIZE]
    var mibSize = mib.count
    if sysctl(UnsafeMutablePointer<Int32>(mutating: mib), u_int(mibSize), &size, &sizeLen, nil, 0) == 0 {
        return Double(size) / (1024 * 1024 * 1024)
    }
    
    return nil
}
