// Made with Swift Json Theme Manager Template by Felipe Garcia
//
//  UIButtonThemeExtension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 28/07/19.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import SwiftJsonThemeManager

public enum UIButtonObjType: String {
    // Add your types here
    case dashboard
    case camera
    case cameraClose
    case popUpButton
    case shareButton
    case none
}

extension UIButton {

// ATENTION to have your custom key, always need to be unique for each extension
// Tip: Create a file that have all the key's so you have sure neve have duplicated
    @IBInspectable var identifierUIButtonThemeExtensionName: String {
        get {
            return associatedObject(base: self, key: &customUIButtonThemeExtensionId, initialiser: { () -> NSString in
                return ""
            }) as String
        }
        set {
            associateObject(base: self, key: &customUIButtonThemeExtensionId, value: newValue as NSString)
        }
    }

    public var viewUIButtonObjType: UIButtonObjType {
        get {
            return UIButtonObjType(rawValue: identifierUIButtonThemeExtensionName) ?? .none
        }
        set {
            identifierUIButtonThemeExtensionName = newValue.rawValue
        }
    }
}

extension UIButton: ThemedView {
  
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyUIAppearance()
    }
    
    public func applyUIAppearance(with theme: Theme? = nil, avoid thisViews: [Any]? = nil) {
  
        // Check if I should not try to apply template to this view
        if let list = thisViews {
            let isMyType = list.compactMap({ $0 as? UIButton })
            if isMyType.first(where: { view in return view.isEqual(self) }) != nil {
                return
            }
        }
        
        let theme = theme ?? ThemeManager.currentTheme
        
        switch viewUIButtonObjType {
        case .dashboard:
            backgroundColor = theme.getThemeColor(name: "button.dashboardCameraBackground")
            let titleColor = theme.getThemeColor(name: "button.dashboardCameraTitleLabel")
            setTitleColor(titleColor, for: .normal)
            removeBorder()
            let shadow = theme.getThemeColor(name: "button.dashboardCameraShadow")
            addBorder(color: shadow, width: 3.0, side: .Bottom, .Right)
        case .camera:
            backgroundColor = theme.getThemeColor(name: "button.cameraBackground")
            let titleColor = theme.getThemeColor(name: "button.cameraTitleLabel")
            setTitleColor(titleColor, for: .normal)
            let shadow = theme.getThemeColor(name: "button.cameraShadow")
            addBorder(color: shadow, width: 3.0, side: .Top, .Bottom, .Right, .Left)
        case .cameraClose:
            let titleColor = theme.getThemeColor(name: "button.cameraCloseButtonLabel")
            setTitleColor(titleColor, for: .normal)
        case .popUpButton:
            backgroundColor = theme.getThemeColor(name: "button.popupButtonBackground")
            let titleColor = theme.getThemeColor(name: "button.popupButtonTitleLabel")
            setTitleColor(titleColor, for: .normal)
        case .shareButton:
            backgroundColor = theme.getThemeColor(name: "button.shareButtonBackground")
            let titleColor = theme.getThemeColor(name: "button.shareButtonTitleLabel")
            setTitleColor(titleColor, for: .normal)
            let shadow = theme.getThemeColor(name: "button.shareButtonShadow")
            addBorder(color: shadow, width: 3.0, side: .Top, .Bottom, .Right, .Left)
        default: break
        }

        
        // When you want to have a custom implementation only to that class use this
        if let aSelf = self as? CustomTheme { aSelf.customTheme(theme) }
    }
    
    open override func prepareForInterfaceBuilder() {
        applyUIAppearance()
    }
}
