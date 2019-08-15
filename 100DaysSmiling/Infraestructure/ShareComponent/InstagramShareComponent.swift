//
//  InstagramShareComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 13/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class InstagramShareComponent: NSObject, UIDocumentInteractionControllerDelegate, ShareComponentProtocol {
    
    private let documentInteractionController = UIDocumentInteractionController()
    private let uti = "com.instagram.exclusivegram"
    private let fileNameExtension = "instagram.igo"
    
    var type = ShareComponentEnum.instagram
    
    static func canIShareUsingThisChannel() -> Bool {
        let instagramURL = URL(string: "instagram://")
        return UIApplication.shared.canOpenURL(instagramURL!)
    }
        
    func postImageWithCaption(image data: UIImage, caption string: String, present viewController: UIViewController) {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let saveImagePath = (documentsPath as NSString).appendingPathComponent("instagram.igo")
        let imageURL = URL(fileURLWithPath: saveImagePath)

        do {
            try data.pngData()?.write(to: imageURL, options: .atomic)
        } catch {
            print("Instagram sharing error")
        }
        documentInteractionController.url = imageURL
        documentInteractionController.annotation = ["InstagramCaption" : string]
        documentInteractionController.uti = "com.instagram.exclusivegram"
        
        documentInteractionController.presentOpenInMenu(from: viewController.view.bounds, in: viewController.view, animated: true)
    }
}
