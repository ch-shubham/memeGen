//
//  MemeViewModal.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import Foundation
class MemeViewModal {
    
    private var currentSelection:Int?
    
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
    
    func setCurrentSelection(at index: Int){
        currentSelection = index;
    }
    
    func getNextMeme() -> Meme?{
        if currentSelection! >= (memeData?.data.memes.count)! - 1 {
            currentSelection = 0
            return memeData?.data.memes[0]
        }
        setCurrentSelection(at: (currentSelection ?? 0) + 1)
        return memeData?.data.memes[currentSelection ?? 0]
    }
    
    
    func getPreviousMeme() -> Meme?{
        if currentSelection! <= 0 {
            currentSelection = (memeData?.data.memes.count)! - 1
            return memeData?.data.memes[0]
        }
        setCurrentSelection(at: (currentSelection ?? 0) - 1)
        return memeData?.data.memes[currentSelection ?? 0]
    }
}
