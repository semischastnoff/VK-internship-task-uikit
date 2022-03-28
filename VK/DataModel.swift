//
//  DataModel.swift
//  VK
//
//  Created by Данила Семисчастнов on 28.03.2022.
//

import Foundation
import Combine

class DataModel {
    
    var data: [Cell] = []
    
    
    init() {
        self.fetchData()
    }
}
