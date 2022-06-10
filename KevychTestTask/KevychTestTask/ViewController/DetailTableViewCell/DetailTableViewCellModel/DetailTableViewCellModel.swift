//
//  DetailTableViewCellModel.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import Foundation
import UIKit


class DetailTableViewCellModel {
    
    let modelData: StoringModel
    
    init(model: StoringModel) {
        self.modelData = model
    }
    
    func loadingData() -> Data{
       return modelData.imageData
    }
    
}

