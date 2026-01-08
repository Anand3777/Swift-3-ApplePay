//
//  Array.swift
//  BuildMart
//
//  Created by Muneeb on 07/06/2023.
//

import Foundation
extension Array {
    func chunk(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
