//
//  ShareViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

// TODO: (dunyakirkali) Move
extension DefaultsKeys {
    static let dates = DefaultsKey<[Date]>("dates", defaultValue: [])
}

class ShareViewController: UIViewController {
    var previewImage: UIImage?
    
    // IBOutlet
    @IBOutlet weak var previewImageView: UIImageView!
    
    // Public cariables
    var router: ShareRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewImageView.image = previewImage
    }

    @IBAction func didTapShare(_ sender: Any) {
        if alreadyShared() {
            showAlert()
        } else {
            presentShareActivity()
        }
    }
    
    private func presentShareActivity() {
        let activityViewController = UIActivityViewController(activityItems: shareData(), applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                let calendar = Calendar.current
                let today = calendar.startOfDay(for: Date())
                Defaults[.dates].append(today)
                self.router.complete()
            }
        }
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func shareData() -> [Any] {
        let day = dayCount()
        let text = "Day \(day) of #100dayssmiling"
        return [text, previewImage!]
    }
    
    private func dayCount() -> Int {
        let dates: [Date] = Defaults[.dates]
        return dates.count + 1
    }
    
    private func alreadyShared() -> Bool {
        let dates: [Date] = Defaults[.dates]
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        return dates.contains(today)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Oups", message: "You already made a photo today", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) in
            self.router.complete()
        }))
        
        self.present(alert, animated: true)
    }
}
