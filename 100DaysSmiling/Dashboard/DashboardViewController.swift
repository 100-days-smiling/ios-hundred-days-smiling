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
        setupUI()
    }
    
    private func setupUI() {
        cameraButton.addBorder(color: UIColor.black, width: 2.0, side: .Bottom, .Right)
    }
    
    @IBAction func takePicture() {
        router.takePicture()
    }
}
