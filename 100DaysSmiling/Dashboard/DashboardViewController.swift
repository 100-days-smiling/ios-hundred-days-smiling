//
//  DashboardViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import Swinject

class DashboardViewController: UIViewController {

    // IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cameraButton: UIButton!
    
    // Public cariables
    var router: DashboardRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func takePicture() {
        router.takePicture()
    }
}
