// Made with Swift Json Theme Manager Template by Felipe Garcia
//
//  UITextFieldExtension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 30/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import SwiftJsonThemeManager

public enum TextFieldTheme: String {
    case popUp
    case none
}

extension UITextField {

// ATENTION to have your custom key, always need to be unique for each extension
// Tip: Create a file that have all the key's so you have sure neve have duplicated
    @IBInspectable var identifierUITextFieldExtensionName: String {
        get {
            return associatedObject(base: self, key: &customUITextFieldExtensionId, initialiser: { () -> NSString in
                return ""
            }) as String
        }
        set {
            associateObject(base: self, key: &customUITextFieldExtensionId, value: newValue as NSString)
        }
    }

    public var viewTextFieldTheme: TextFieldTheme {
        get {
            return TextFieldTheme(rawValue: identifierUITextFieldExtensionName) ?? .none
        }
        set {
            identifierUITextFieldExtensionName = newValue.rawValue
        }
    }
}

extension UITextField: ThemedView {
  
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyUIAppearance()
    }
    
    public func applyUIAppearance(with theme: Theme? = nil, avoid thisViews: [Any]? = nil) {
  
        // Check if I should not try to apply template to this view
        if let list = thisViews {
            let isMyType = list.compactMap({ $0 as? UITextField })
            if isMyType.first(where: { view in return view.isEqual(self) }) != nil {
                return
            }
        }
        
        let theme = theme ?? ThemeManager.currentTheme

        switch viewTextFieldTheme {
            case .popUp:
                layer.borderWidth = 1.0
                layer.borderColor = theme.getThemeColor(name: "textField.popupBorderColor").cgColor
	        default: break
        }

        // When you want to have a custom implementation only to that class use this
        if let aSelf = self as? CustomTheme { aSelf.customTheme(theme) }
    }
    
    open override func prepareForInterfaceBuilder() {
        applyUIAppearance()
    }
}
