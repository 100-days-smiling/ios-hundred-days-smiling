//
//  ViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 21/06/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import Swinject
import SafariServices
import OAuthSwift

class ViewController: UIViewController {

    var twitterService: APITwitterService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Felipe - Reorganize to when use the properly handle of the instance initialization
        twitterService = AppDelegate.container.resolve(APITwitterService.self)!
    }

    @IBAction func loginRegister() {
        twitterService?.requestAuthotization(using: { oauth -> SafariURLHandler in
            return showSafari(using: oauth)
        })
    }
    
    @IBAction func dashboard() {
        let dashboard = DashboardViewController()
        self.present(dashboard, animated: true, completion: nil)
    }
    
    func showSafari(using oauth: OAuth1Swift) -> SafariURLHandler {
        let handler = SafariURLHandler(viewController: self, oauthSwift: oauth)
        handler.presentCompletion = {
            print("Safari presented")
        }
        handler.dismissCompletion = {
            print("Safari dismissed")
        }
        handler.factory = { url in
            let controller = SFSafariViewController(url: url)
            // Customize it, for instance
            if #available(iOS 10.0, *) {
                //  controller.preferredBarTintColor = UIColor.red
            }
            return controller
        }
        
        return handler
    }
}
