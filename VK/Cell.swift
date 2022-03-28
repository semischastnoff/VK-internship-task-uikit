//
//  Cell.swift
//  VK
//
//  Created by Данила Семисчастнов on 28.03.2022.
//

import Foundation


struct Cell: Decodable {
    let id: Int
    let date: String
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "date"
        case value = "value"
    }
}
