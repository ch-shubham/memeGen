//
//  DetailsVCViewController.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import UIKit

class DetailsVCViewController: UIViewController {
    var meme: Meme?

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setVCProperties()
    }

    func setVCProperties() {
        self.imageView.loadThumbnail(urlSting: meme?.url ?? "https://dummyimage.com/300x300")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
