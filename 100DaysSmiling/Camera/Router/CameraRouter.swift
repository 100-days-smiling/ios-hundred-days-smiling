//
//  CameraRouter.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 19/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import UIKit

protocol CameraRouterProtocol {
    func share(image: UIImage)
    func closeCameraFlow()
}

class CameraRouter: NSObject, CameraRouterProtocol {
    
    private var viewController: CameraViewController
    private var shareViewController: ShareViewController
    
    init(view controller: CameraViewController, share: ShareViewController) {
        self.viewController = controller
        self.shareViewController = share
    }
    
    func share(image: UIImage) {
        // TODO: (dunyakirkali) Does this belong here?
        shareViewController.previewImage = image
        self.viewController.present(shareViewController, animated: true, completion: nil)
    }
    
    func closeCameraFlow() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
