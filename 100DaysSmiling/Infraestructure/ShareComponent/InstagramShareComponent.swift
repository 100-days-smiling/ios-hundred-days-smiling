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
        
        let jpgPath = (NSTemporaryDirectory() as NSString).appendingPathComponent(fileNameExtension)
        
        do {
            try data.jpegData(compressionQuality: 0.75)?.write(to: URL(fileURLWithPath: jpgPath), options: .atomic)
        } catch {
            print(error)
        }
        
        let rect = CGRect.zero
        let fileURL = NSURL.fileURL(withPath: jpgPath)
        
        
        documentInteractionController.url = fileURL
        documentInteractionController.delegate = self
        documentInteractionController.uti = uti
        
        // adding caption for the image
        documentInteractionController.annotation = ["InstagramCaption": string]
        documentInteractionController.presentOpenInMenu(from: rect, in: viewController.view, animated: true)
    }
}
