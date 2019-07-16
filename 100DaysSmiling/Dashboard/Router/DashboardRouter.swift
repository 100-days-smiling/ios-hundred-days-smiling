//
//  DashboardRouter.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 16/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

protocol DashboardRouterProtocol {
    func takePicture()
}

class DashboardRouter: NSObject, DashboardRouterProtocol {
    
    private var viewController: DashboardViewController
    private var cameraViewController: CameraViewController
    
    init(view controller: DashboardViewController, camera: CameraViewController) {
        self.viewController = controller
        self.cameraViewController = camera
    }
    
    func takePicture() {
        self.viewController.present(cameraViewController, animated: true, completion: nil)
    }
}
