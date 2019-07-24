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
        
        // Inner helper function
        func addNewBorder(color: UIColor, frame: CGRect) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = frame
            border.name = "border"
            self.layer.addSublayer(border)
        }
        
        side.forEach { borderSide in
            switch borderSide {
            case .Top:
                let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
                addNewBorder(color: color, frame: frame)
            case .Bottom:
                let frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
                addNewBorder(color: color, frame: frame)
            case .Left:
                let frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
                addNewBorder(color: color, frame: frame)
            case .Right:
                let frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
                addNewBorder(color: color, frame: frame)
            }
        }
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
