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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
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
    
    @IBAction func didTapRetry(_ sender: Any) {
        router.retry()
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        router.cancel()
    }
}

// MARK: - Private Methods
extension ShareViewController {

    func presentShareActivity() {
        guard let image = self.previewImage else { return  }
        var shareData = Calculator.shareData
        shareData.append(image)
        let activityViewController = UIActivityViewController(activityItems: shareData, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [.mail, .print, .assignToContact, .addToReadingList, .airDrop,. openInIBooks, .markupAsPDF]
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
