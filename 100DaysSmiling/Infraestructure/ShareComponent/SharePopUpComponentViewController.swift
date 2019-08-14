//
//  SharePopUpComponentViewController.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 14/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class SharePopUpComponentViewController: UIViewController {

    @IBOutlet var shareButtons: [UIButton]!
    
    let shareComponent = ShareComponent()
    var shareDelegate: ShareViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        validateIfChannelIsAvailable()
    }
    
    // MARK: Action
    @IBAction func shareButton(_ sender: UIButton) {
        let networkList = self.shareComponent.networkThatICanShare()
        
        if let network = networkList.first(where: { $0.type.hashValue == sender.tag }) {
            self.shareDelegate?.presentShareActivity(using: network)
        } else {
            // Fallback that failed :(
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Functions
    private func validateIfChannelIsAvailable() {
        let networkList = shareComponent.networkThatICanShare()
        shareButtons.forEach { button in
            if networkList.first(where: { $0.type.item == button.tag }) == nil {
                button.isHidden = true
            }
        }
    }
}
