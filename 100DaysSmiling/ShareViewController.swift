//
//  ShareViewController.swift
//  100DaysSmiling
//
//  Created by Dunya Kirkali on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    @IBAction func didTapShare(_ sender: Any) {
        let text = "#100dayssmiling"
        let image: UIImage = UIImage(named: "splash_screen_smile")!
        let shareAll: [Any] = [text, image]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
