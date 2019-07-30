//
//  UserNameViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 29/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

protocol UserNameProtocol: class {
    func finishAddingName(name: String?)
}

class UserNameViewController: UIViewController {

    @IBOutlet var userNameField: UITextField!
    var delegate: UserNameProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
    
    @IBAction func done() {
        validateField()
    }
    
    private func validateField() {
        guard let textField = userNameField.text else {
            delegate?.finishAddingName(name: nil)
            return
        }
        
        if !(textField.count > 0) {
            showAlertThatIsEmpty()
        } else {
            delegate?.finishAddingName(name: textField)
        }
    }
    
    private func showAlertThatIsEmpty() {
        let alert = UIAlertController(title: "No name :(",
                                      message: "You can left empty :( , but would be nice to set, I will try next time than :D ",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            self?.fadeOutAndDismiss()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func fadeOutAndDismiss() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        }) { [weak self] completed in
            if completed {
                self?.delegate?.finishAddingName(name: nil)
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
