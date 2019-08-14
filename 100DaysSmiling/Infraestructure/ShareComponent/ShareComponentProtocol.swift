//
//  ShareComponentProtocol.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 13/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

protocol ShareComponentProtocol: class {
    var type: ShareComponentEnum { get }
    static func canIShareUsingThisChannel() -> Bool
    func postImageWithCaption(image data: UIImage, caption string: String, present viewController: UIViewController)
}
