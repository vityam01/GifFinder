//
//  StoringModel.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import Foundation
import Unrealm



struct LocalModel: Realmable {
    var models = [StoringModel]()
    var id = "Id111"
    
    mutating func storing(with model: StoringModel) {
        models.append(model)
    }
    
    static func primaryKey() -> String? {
            return "id"
        }
}

struct StoringModel: Realmable {
    var imageData: Data = Data()
    var title: String = ""
    var date: String = ""
}


