//
//  LanguageModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 24/11/25.
//

import Foundation

// MARK: - LanguageModel
struct LanguageModel: Codable {
    let version, detail, message: String?
    let data: [LanguageData]?
    let meta: Meta?
}

// MARK: - Datum
struct LanguageData: Codable {
    let id: Int?
    let countryName, language, languageCode, currency: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case countryName = "country_name"
        case language
        case languageCode = "language_code"
        case currency, image
    }
}
