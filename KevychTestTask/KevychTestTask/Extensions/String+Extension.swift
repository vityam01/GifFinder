//
//  String+Extension.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 28.05.2022.
//

import Foundation

//MARK: Localized
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
