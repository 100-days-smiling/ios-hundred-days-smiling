//
//  UserNameComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 29/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let userName = DefaultsKey<String?>("user.name")
}

class UserNameComponent: NSObject {
    
    private var showAlertIsEmpty: Bool = false
    private var viewController: UIViewController
    private let alert = UserNameViewController()
    private var hasNameCallback: ((String) -> ())?
    
    init(view controller: UIViewController) {
        viewController = controller
        alert.modalPresentationStyle = .overCurrentContext
    }
    
    func checkIfUserIsAlreadySet() -> Bool {
        guard let userName = Defaults[.userName] else { return false }
        return userName.count > 0
    }
    
    func setUserName(using name: String) {
        Defaults[.userName] = name
    }
    
    func getUserName() -> String {
        let name: String = Defaults[.userName] ?? ""
        return name
    }
    
    func showAlert(has nameCallback: @escaping (String) -> ()) {
        hasNameCallback = nameCallback
        alert.delegate = self
        self.viewController.present(alert, animated: true, completion: nil)
    }
}

extension UserNameComponent: UserNameProtocol {
    func finishAddingName(name: String?) {
        if let userName = name {
            setUserName(using: userName)
            hasNameCallback?(userName)
        } else {
            hasNameCallback?("Anonymous ;)")
        }
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
