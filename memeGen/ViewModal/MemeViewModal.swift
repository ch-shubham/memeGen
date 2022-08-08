//
//  MemeViewModal.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import Foundation
class MemeViewModal {
    
    init() {
        
    }
    private let networkManager = NetworkingManager.shared
    var timeToReloadTable: (() -> ())?
    var memeData: MemeData? {
        didSet {
            self.timeToReloadTable?()
        }
    }
    
    func fetchMemesFromServer() {
     //  let myURL = URL(string: "https://api.imgflip.com/get_memes")
        networkManager.getData(url: MyConstants.getMemesURL(), objectType: MemeData.self) { data in
            switch data {
            case .success(let myData):
                self.memeData = myData
                
            case .failure(let error): break
                //handle error
                print(error)
            }
        }
    }
}
