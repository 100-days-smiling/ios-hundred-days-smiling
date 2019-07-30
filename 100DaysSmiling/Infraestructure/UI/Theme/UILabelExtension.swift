// Made with Swift Json Theme Manager Template by Felipe Garcia
//
//  UILabelExtension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 18/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import SwiftJsonThemeManager

public enum LabelViewTheme: String {
    case titleDashboard
    case descriptionDashboard
    case subtitleDashboard
    case popUp
    case none
}

extension UILabel {

    @IBInspectable var identifierUILabelExtensionName: String {
        get {
            return associatedObject(base: self, key: &labelExtensionId, initialiser: { () -> NSString in
                return ""
            }) as String
        }
        set {
            associateObject(base: self, key: &labelExtensionId, value: newValue as NSString)
        }
    }

    public var viewLabelViewTheme: LabelViewTheme {
        get {
            return LabelViewTheme(rawValue: identifierUILabelExtensionName) ?? .none
        }
        set {
            identifierUILabelExtensionName = newValue.rawValue
        }
    }
}

extension UILabel: ThemedView {
  
    open override func awakeFromNib() {
        super.awakeFromNib()
        applyUIAppearance()
    }
    
    public func applyUIAppearance(with theme: Theme? = nil, avoid thisViews: [Any]? = nil) {
  
        // Check if I should not try to apply template to this view
        if let list = thisViews {
            let isMyType = list.compactMap({ $0 as? UILabel })
            if isMyType.first(where: { view in return view.isEqual(self) }) != nil {
                return
            }
        }
        
        let theme = theme ?? ThemeManager.currentTheme
        
        switch viewLabelViewTheme {
            case .titleDashboard:
                font = theme.getThemedFont(name: "label.dashboardTitleFont")
                textColor = theme.getThemeColor(name: "label.dashboardTitleColor")
            case .descriptionDashboard:
                font = theme.getThemedFont(name: "label.dashboardDescriptionFont")
                textColor = theme.getThemeColor(name: "label.dashboardDescriptionColor")
            case .subtitleDashboard:
                font = theme.getThemedFont(name: "label.subtitleDashboardFont")
                textColor = theme.getThemeColor(name: "label.subtitleDashboardColor")
            case .popUp:
                font = theme.getThemedFont(name: "label.subtitleDashboardFont")
                textColor = theme.getThemeColor(name: "label.popupTitleColor")
            default: break
        }
        
        // When you want to have a custom implementation only to that class use this
        if let aSelf = self as? CustomTheme { aSelf.customTheme(theme) }
    }
    
    open override func prepareForInterfaceBuilder() {
        applyUIAppearance()
    }
}
