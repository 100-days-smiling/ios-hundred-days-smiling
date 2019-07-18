// Made with Swift Json Theme Manager Template by Felipe Garcia
//
//  UIViewControllerExtension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 17/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import SwiftJsonThemeManager

public enum ViewControllerViewTheme: String {
    // Add your types here
    case defaultView
    case none
}

extension UIViewController {

// ATENTION to have your custom key, always need to be unique for each extension
// Tip: Create a file that have all the key's so you have sure neve have duplicated
    @IBInspectable var identifierUIViewControllerExtensionName: String {
        get {
            return associatedObject(base: self, key: &viewControllerId, initialiser: { () -> NSString in
                return ""
            }) as String
        }
        set {
            associateObject(base: self, key: &viewControllerId, value: newValue as NSString)
        }
    }

    public var viewViewControllerViewTheme: ViewControllerViewTheme {
        get {
            return ViewControllerViewTheme(rawValue: identifierUIViewControllerExtensionName) ?? .none
        }
        set {
            identifierUIViewControllerExtensionName = newValue.rawValue
        }
    }
}

extension UIViewController: ThemedView {
  
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyUIAppearance()
    }
    
    public func applyUIAppearance(with theme: Theme? = nil, avoid thisViews: [Any]? = nil) {
  
        ThemeManager.registerForThemeUpdates(self)
        
        let theme = theme ?? ThemeManager.currentTheme

        switch viewViewControllerViewTheme {
            case .defaultView:
                self.view.backgroundColor = theme.getThemeColor(name: "backgroundViewController.defaultView")
            case .none: return
        }
                
        // When you want to have a custom implementation only to that class use this
        if let aSelf = self as? CustomTheme { aSelf.customTheme(theme) }
    }
    
    open override func prepareForInterfaceBuilder() {
        applyUIAppearance()
    }
}
