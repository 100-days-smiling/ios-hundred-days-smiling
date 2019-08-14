//
//  ShareViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

protocol ShareViewControllerProtocol {
    func presentShareActivity(using network: ShareComponentProtocol)
}

// MARK: - ShareViewController
class ShareViewController: UIViewController {
    var previewImage: UIImage?
    
    // IBOutlet
    @IBOutlet weak var previewImageView: UIImageView!
    
    // Public variables
    var router: ShareRouterProtocol!
    var sharePopup: SharePopUpComponentViewController!
    
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
            // Show popup
            sharePopup.modalPresentationStyle = .overCurrentContext
            self.present(sharePopup, animated: true, completion: nil)
//            presentShareActivity()
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
extension ShareViewController: ShareViewControllerProtocol {
    func presentShareActivity(using network: ShareComponentProtocol) {
        guard let image = self.previewImage else { return  }
        
        var shareData = Calculator.shareData

        network.postImageWithCaption(image: image, caption: Calculator.shareData, present: self)
        
//        shareData.append(previewImage!)
//        let activityViewController = UIActivityViewController(activityItems: shareData, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        activityViewController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
//            if completed == true {
//                Calculator.record()
//                self.router.complete()
//            }
//        }
//        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Oups", message: "You already made a photo today", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) in
            self.router.complete()
        }))
        
        self.present(alert, animated: true)
    }
}
