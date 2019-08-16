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
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var fakeImageForSimulator: UIImageView!
    
    // Public variables
    var router: CameraRouterProtocol!
    
    // View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCamera()
        dayLabel.text = "Day \(Calculator.dayCount)"
    }
    
    @IBAction func closeCamera() {
        router.closeCameraFlow()
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
        allowBackgroundAudio = false
        audioEnabled = false
        shouldPrompToAppSettings = false
        cameraDelegate = self
        doubleTapCameraSwitch = false
        cameraButton.delegate = self

        #if targetEnvironment(simulator)
            // Only for when at simulator
            setupForSimulator()
        #endif
    }
    
    #if targetEnvironment(simulator)
    func setupForSimulator() {
        let gestureForButton = UITapGestureRecognizer(target: self, action: #selector(takePictureWhenOnSimulator))
        cameraButton.addGestureRecognizer(gestureForButton)
        fakeImageForSimulator.isHidden = false
    }
    
    @objc func takePictureWhenOnSimulator() {
        router.share(image: self.fakeImageForSimulator.image!)
    }
    #endif
}
