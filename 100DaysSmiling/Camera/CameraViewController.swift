//
//  CameraViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SwiftyCam

// MARK: - CameraViewController
class CameraViewController: SwiftyCamViewController {
    
    // IBOutlet
    @IBOutlet weak var cameraButton: SwiftyCamButton!
    
    // Public variables
    var router: CameraRouterProtocol!
    
    // View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCamera()
    }
}

// MARK: - SwiftyCamViewControllerDelegate
extension CameraViewController: SwiftyCamViewControllerDelegate {
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        router.share(image: photo)
    }
}

// MARK: - Private Methods
private extension CameraViewController {
    func configureCamera() {
        defaultCamera = .front
        cameraDelegate = self
        doubleTapCameraSwitch = false
        cameraButton.delegate = self
    }
}
