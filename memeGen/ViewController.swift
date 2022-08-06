//
//  ViewController.swift
//  memeGen
//
//  Created by user224812 on 8/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.labelCell.text = "Label"
        cell.imageViewCell.image = UIImage(named: "ellipse")
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CardCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CardCell")
        tableView.delegate = self
        tableView.dataSource = self
    }


}

