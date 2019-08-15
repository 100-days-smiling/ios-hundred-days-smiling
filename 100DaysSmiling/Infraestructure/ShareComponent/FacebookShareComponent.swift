//
//  FacebookShareComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 13/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import FBSDKShareKit

class FacebookShareComponent: NSObject, ShareComponentProtocol {
    
    var type = ShareComponentEnum.facebook
    
    static func canIShareUsingThisChannel() -> Bool {
        let instagramURL = URL(string: "fb://")
        return UIApplication.shared.canOpenURL(instagramURL!)
    }
    
    func postImageWithCaption(image data: UIImage, caption string: String, present viewController: UIViewController) {
        let photo = SharePhoto(image: data, userGenerated: true)
        let photoContent = SharePhotoContent()
        photoContent.hashtag = Hashtag("#100dayssmiling")
        photoContent.photos = [photo]
        
        let shareDialog = ShareDialog(fromViewController: viewController, content: photoContent, delegate: nil)
        shareDialog.show()
    }
}
