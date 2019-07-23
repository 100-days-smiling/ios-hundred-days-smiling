//
//  UIButton+Extension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 23/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

public enum UIButtonBorderSide {
    case Top, Bottom, Left, Right
}

extension UIButton {
    
    public func addBorder(color: UIColor = UIColor.black, width: CGFloat = 1.0, side: UIButtonBorderSide...) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        side.forEach { borderSide in
            switch borderSide {
            case .Top:
                border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
            case .Bottom:
                border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
            case .Left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            case .Right:
                border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
            }
        }
        
        border.name = "border"
        self.layer.addSublayer(border)
    }
    
    public func removeBorder(){
        if((self.layer.sublayers) != nil){
            for layer in self.layer.sublayers! {
                if layer.name == "border" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
}
