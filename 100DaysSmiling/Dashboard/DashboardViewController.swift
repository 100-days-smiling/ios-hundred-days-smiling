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
}

// MARK: - IBActions
extension DashboardViewController {
    @IBAction func takePicture() {
        router.takePicture()
    }
}
