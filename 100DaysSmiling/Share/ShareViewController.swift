//
//  ShareViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

// MARK: - ShareViewController
class ShareViewController: UIViewController {
    var previewImage: UIImage?
    
    // IBOutlet
    @IBOutlet weak var previewImageView: UIImageView!
    
    // Public variables
    var router: ShareRouterProtocol!
    
    // View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewImageView.image = previewImage
    }
}

// MARK: - IBActions
extension ShareViewController {
    @IBAction func didTapShare(_ sender: Any) {
        if Calculator.alreadyShared {
            showAlert()
        } else {
            presentShareActivity()
        }
    }
}

// MARK: - Private Methods
private extension ShareViewController {
    func presentShareActivity() {
        var shareData = Calculator.shareData
        shareData.append(previewImage!)
        let activityViewController = UIActivityViewController(activityItems: shareData, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                Calculator.record()
                self.router.complete()
            }
        }
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Oups", message: "You already made a photo today", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) in
            self.router.complete()
        }))
        
        self.present(alert, animated: true)
    }
}
