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

        // Do any additional setup after loading the view.
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
            self?.delegate?.finishAddingName(name: nil)
            self?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
