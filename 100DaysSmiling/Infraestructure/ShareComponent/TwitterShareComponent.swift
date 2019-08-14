//
//  TwitterShareComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 13/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class TwitterShareComponent: ShareComponentProtocol {
    
    var type = ShareComponentEnum.twitter
    
    static func canIShareUsingThisChannel() -> Bool {
        let instagramURL = URL(string: "twitter://")
        return UIApplication.shared.canOpenURL(instagramURL!)
    }
    
    func postImageWithCaption(image data: UIImage, caption string: String, present viewController: UIViewController) {
        
    }
}
