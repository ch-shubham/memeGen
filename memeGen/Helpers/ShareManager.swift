//
//  ShareManager.swift
//  memeGen
//
//  Created by user224812 on 8/9/22.
//
//
//import UIKit
//
//class ShareManager {
////    static var shared: ShareManager = {
////        let instance = ShareManager()
////        return instance
////    }()
////
//
//    func shareOnWhatsapp() {
//        var interaction: UIDocumentInteractionController
//        let urlWhats = "whatsapp://app"
//           if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
//               if let whatsappURL = URL(string: urlString) {
//
//                   if UIApplication.shared.canOpenURL(whatsappURL as URL) {
//
//    //                   loadThumbnail(urlSting: meme?.url ?? "link to a placeholder image")
//                       if let image = UIImage(named: "background") {
//                           if let imageData = image.jpegData(compressionQuality: 1.0) {
//                               let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsAppTmp.wai")
//                               do {
//                                   try imageData.write(to: tempFile, options: .atomic)
//                                   interaction = UIDocumentInteractionController(url: tempFile)
//                                   interaction.uti = "net.whatsapp.image"
//                                   interaction.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
//
//                               } catch {
//                                   print(error)
//                               }
//                           }
//                       }
//
//                   } else {
//                      print("Cannot open whatsapp")
//                   }
//               }
//           }
//    }
//
//}
