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
    static let startDate = DefaultsKey<Date>("start_date", defaultValue: Date())
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
        presentShareActivity()
    }
    
    private func presentShareActivity() {
        let activityViewController = UIActivityViewController(activityItems: shareData(), applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                self.router.complete()
            }
        }
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func shareData() -> [Any] {
        let day = numberOfDays()
        let text = "Day \(day) of #100dayssmiling"
        return [text, previewImage!]
    }
    
    private func numberOfDays() -> Int {
        let calendar = Calendar.current
        
        let date1: Date = Defaults[.startDate]
        let date2: Date = Date()
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        return components.day! + 1
    }
}
