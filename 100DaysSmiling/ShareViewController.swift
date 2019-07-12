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
    @IBAction func didTapShare(_ sender: Any) {
        presentShareActivity()
    }
    
    private func presentShareActivity() {
        let activityViewController = UIActivityViewController(activityItems: shareData(), applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func shareData() -> [Any] {
        let day = numberOfDays()
        let text = "Day \(day) of #100dayssmiling"
        let image: UIImage = UIImage(named: "splash_screen_smile")!
        return [text, image]
    }
    
    private func numberOfDays() -> Int {
        let calendar = Calendar.current
        
        let date1: Date = Defaults[.startDate]
        let date2: Date = Date()
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        return components.day! + 1
    }
}
