//
//  ViewControllerModel.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import Foundation
import UIKit
import Unrealm

protocol ViewControllerModelDelegate: AnyObject {
    func callAlert(title: String, message: String, buttonText: String)
    func updateUI()
}

class ViewControllerModel {
    
    let controllerTitleText = LocalizationKeys.Controller.Text.titleText.rawValue.localized
    let titleMassage = LocalizationKeys.AlertController.Message.title.rawValue.localized
    let message = LocalizationKeys.AlertController.Message.message.rawValue.localized
    let buttonName = LocalizationKeys.AlertController.Message.buttonText.rawValue.localized
    
    //DataSource з якого відбираю данні в таблиці шоб відобразити інформацію, вставляю її в масив, а потім перезагружаю таблицю
    var arrayModel = [StoringModel]()
    
   weak var delegate: ViewControllerModelDelegate?
    
    func getRequest(searchWorld: String) {
        APICaller.shared.getMovies(keyValue: searchWorld, completion: { [ weak self ] result in
            switch result {
            case .success(let name):
                var local = self?.localObject() ?? LocalModel()
                guard let name = name else { DispatchQueue.main.async {
                    self?.delegate?.callAlert(title: self?.titleMassage ?? "",
                                              message: self?.message ?? "",
                                              buttonText: self?.buttonName ?? "")
                }
                    return
            }
                local.storing(with: name)
                self?.saveDataToRealm(data: local)
                self?.arrayModel = [name]
                self?.delegate?.updateUI()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func returnCellModel(indexPath: IndexPath) -> DetailTableViewCellModel {
        let value = DetailTableViewCellModel(model: arrayModel[indexPath.row])
        return value
    }
    
    func numberOfRowsInSection() -> Int {
        return arrayModel.count
        
    }
    
    func heightForRow() -> CGFloat {
        return 200
    }
    
    func saveDataToRealm<T:Realmable>(data: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(data, update: .all)
        }
    }
    
    
    func loadData() {
        let data = localObject()
        arrayModel = data.models
        delegate?.updateUI()
    }
    
    func localObject() -> LocalModel {
        let realm = try! Realm()
        guard let object = realm.object(ofType: LocalModel.self,
                                        forPrimaryKey: "Id111") else {
            let object = LocalModel()
            saveDataToRealm(data: object)
            return object }
        return object
    }
    
}

