//
//  ViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 21/06/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let container = Container()
        AuthenticationContainer().setupContainer(with: container)
        let twitterService = container.resolve(APITwitterService.self)
        twitterService?.requestAuthotization(view: self)
    }
}

