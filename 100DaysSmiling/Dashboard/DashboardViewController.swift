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

    // MARK: String formating
    enum Formating {
        case titleLabel(name: String)
        case descriptionLabel(days: Int)
        
        var string: String {
            switch self {
            case .titleLabel(name: let name):
                return String(format: "Welcome %@", name)
            case .descriptionLabel(days: let days):
                if days > 1 {
                    return days > 9 ? String(format: "Days %d", days) : String(format: "Day %d", days) //"Day \(Calculator.dayCount)"
                } else {
                    return "You have not started smiling yet, try your first smile today and start sharing your smile."
                }
            }
        }
    }
    
    // IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cameraButton: UIButton!
    
    // Public variables
    var router: DashboardRouterProtocol!
    var userNameComponent: UserNameComponent!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUserNamer()
    }
    
    // MARK: UI Setup
    func setupUI() {
        descriptionLabel.text = Formating.descriptionLabel(days: Calculator.dayCount).string
    }
    
    func setupUserNamer() {
        if userNameComponent.checkIfUserIsAlreadySet() {
            setUserName(using: userNameComponent.getUserName())
        } else {
            userNameComponent.showAlert(has: { [weak self] name in
                self?.setUserName(using: name)
            })
        }
    }
    
    // MARK: IBAction
    @IBAction func takePicture() {
        router.takePicture()
    }
    
    // MARK: Private methods
    private func setUserName(using name: String) {
        self.titleLabel.text = Formating.titleLabel(name: name).string
        self.view.layoutIfNeeded()
    }
}
