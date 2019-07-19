//
//  CameraViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SwiftyCam

class CameraViewController: SwiftyCamViewController {
    
    // IBOutlet
    @IBOutlet weak var cameraButton: SwiftyCamButton!
    
    // Public cariables
    var router: CameraRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultCamera = .front
        cameraDelegate = self
        doubleTapCameraSwitch = false
        cameraButton.delegate = self
    }
}

extension CameraViewController: SwiftyCamViewControllerDelegate {
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        router.share(image: photo)
    }
}
