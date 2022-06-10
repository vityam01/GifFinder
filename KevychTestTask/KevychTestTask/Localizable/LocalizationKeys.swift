//
//  LocalizationKeys.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 28.05.2022.
//

import Foundation


class LocalizationKeys {
    
    /// Service class containing the localization keys set
    ///
    /// The localization keys oredered by:
    ///
    ///  - LocalozationKeys.ModeuleName.ViewName.FieldName
    
    struct AlertController {
        enum Message: String, CaseIterable {
            case title = "AlertController.Message.title"
            case message = "AlertController.Message.message"
            case buttonText = "AlertController.Message.buttonText"
        }
    }
    
    struct Controller {
        enum Text: String, CaseIterable {
            case titleText = "Controller.Text.titleText"
            case searchLineText = "Controller.Text.searchLineText"
        }
    }
    
}


