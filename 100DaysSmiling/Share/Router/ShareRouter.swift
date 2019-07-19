//
//  ShareRouter.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 19/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import UIKit

protocol ShareRouterProtocol {
    func complete()
}

class ShareRouter: NSObject, ShareRouterProtocol {
    
    private var viewController: ShareViewController
    
    init(view controller: ShareViewController) {
        self.viewController = controller
    }
    
    func complete() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
