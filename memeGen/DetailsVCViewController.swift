//
//  DetailsVCViewController.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import UIKit

class DetailsVCViewController: UIViewController {
    var meme: Meme?
    var memeVM: MemeViewModal?
    var documentInteractionController = UIDocumentInteractionController()
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
    @IBAction func nextButtonPressed(_ sender: UIButton) {
//        print(memeVM?.getNextMeme())
        meme = memeVM?.getNextMeme()
        setVCProperties()
    }
    @IBAction func previousButtonPressed(_ sender: UIButton) {
        meme = memeVM?.getPreviousMeme()
        setVCProperties()
    }
    @IBAction func shareButtonPressed(_ sender: Any) {
        let urlWhats = "whatsapp://app"
            if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
                if let whatsappURL = URL(string: urlString) {

                    if UIApplication.shared.canOpenURL(whatsappURL as URL) {

                        if let image = UIImage(named: "whatsappIcon") {
                            if let imageData = image.jpegData(compressionQuality: 1.0) {
                                let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsAppTmp.wai")
                                do {
                                    try imageData.write(to: tempFile, options: .atomic)
                                    self.documentInteractionController = UIDocumentInteractionController(url: tempFile)
                                    self.documentInteractionController.uti = "net.whatsapp.image"
                                    self.documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)

                                } catch {
                                    print(error)
                                }
                            }
                        }

                    } else {
                       print("Cannot open whatsapp")
                    }
                }
            }
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
