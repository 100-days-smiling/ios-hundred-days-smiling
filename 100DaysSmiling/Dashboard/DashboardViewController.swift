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
        case cameraButtonLabel
        case titleLabel(name: String)
        case descriptionLabel(days: Int)
        
        var string: String {
            switch self {
            case .cameraButtonLabel:
                if ChallengeComponent().challengeComplete() {
                    return "Restart"
                }
                return "Show your smile"
            case .titleLabel(name: let name):
                return String(format: "Welcome %@", name)
            case .descriptionLabel(days: let days):
                if days > 1 {
                    return String(format: "Day %d of 100", days)
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
    var challengeComponent = ChallengeComponent()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updatedDate), name: ShareRouter.shareNotificationKey, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUserNamer()
    }
    
    // MARK: UI Setup
    func setupUI() {
        descriptionLabel.text = Formating.descriptionLabel(days: Calculator.dayCount).string
        cameraButton.titleLabel?.text = Formating.cameraButtonLabel.string
    }
    
    func setupUserNamer() {
        if userNameComponent.checkIfUserIsAlreadySet() {
            setUserName(using: userNameComponent.getUserName())
        } else {
            showUserNameAlert()
        }
    }
    
    // MARK: IBAction
    @IBAction func takePicture() {
        router.takePicture()
    }
    
    @IBAction func tappedAtUserName(_ sender: UITapGestureRecognizer) {
        showUserNameAlert()
    }
    
    // MARK: Private methods
    private func setUserName(using name: String) {
        self.titleLabel.text = Formating.titleLabel(name: name).string
        self.view.layoutIfNeeded()
    }
    
    private func showUserNameAlert() {
        userNameComponent.showAlert(has: { [weak self] name in
            self?.setUserName(using: name)
        })
    }
    
    @objc
    private func updatedDate() {
        setupUI()
    }
}
