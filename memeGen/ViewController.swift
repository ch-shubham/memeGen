//
//  ViewController.swift
//  memeGen
//
//  Created by user224812 on 8/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memeViewModal = MemeViewModal()

    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memeViewModal.memeData?.data.memes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardCell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.meme = memeViewModal.memeData?.data.memes[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVCViewController()
        vc.meme = memeViewModal.memeData?.data.memes[indexPath.row]
        vc.memeVM = memeViewModal
        print("Ibdex Path: \(indexPath.row)")
        memeViewModal.setCurrentSelection(at: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

//    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CardCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CardCell")
        tableView.delegate = self
        tableView.dataSource = self
        getMemesData()

    }

    func getMemesData() {
        memeViewModal.timeToReloadTable = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        memeViewModal.fetchMemesFromServer()
    }


}

