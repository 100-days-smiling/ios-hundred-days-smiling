//
//  DashboardViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import Swinject
import SafariServices
import OAuthSwift

// MARK: - DashboardViewController
class DashboardViewController: UIViewController {

    // IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cameraButton: UIButton!
    
    // Public variables
    var router: DashboardRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Calculator.alreadyStarted {
            descriptionLabel.text = "Day \(Calculator.dayCount)"
        } else {
            descriptionLabel.text = "You have not started smiling yet, try your first smile today and start sharing your smile."
        }
    }
    
    @IBAction func takePicture() {
        router.takePicture()
    }
}
