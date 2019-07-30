//
//  UIView+Extension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 30/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

extension UIView {

    // Add corner radious from storboard
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
}
