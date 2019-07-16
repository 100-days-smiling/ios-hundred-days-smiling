//
//  CameraViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SwiftyCam

protocol CameraViewControllerDelegate: class {
    func viewController(_ viewController: CameraViewController, didTakePicture image: UIImage)
}

class CameraViewController: SwiftyCamViewController {
    weak var delegate: CameraViewControllerDelegate?
    
    @IBOutlet weak var cameraButton: SwiftyCamButton!
    
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
        delegate?.viewController(self, didTakePicture: photo)
    }
}
