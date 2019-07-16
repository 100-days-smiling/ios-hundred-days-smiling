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

    var router: DashboardRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func takePicture() {
        router.takePicture()
    }
}
