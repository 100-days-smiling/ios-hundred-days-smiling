//
//  ShareComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 13/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

enum ShareComponentEnum {
    case facebook
    case instagram
    case twitter
    
    var item: Int {
        switch self {
        case .facebook: return 1
        case .instagram: return 2
        case .twitter: return 3
        }
    }
}

class ShareComponent: NSObject {
    
    func networkThatICanShare() -> [ShareComponentProtocol] {
        
        var list = [ShareComponentProtocol]()
        
        if FacebookShareComponent.canIShareUsingThisChannel() {
            let facebookComponent = FacebookShareComponent()
            list.append(facebookComponent)
        }
        
        if InstagramShareComponent.canIShareUsingThisChannel() {
            let instagramComponent = InstagramShareComponent()
            list.append(instagramComponent)
        }
        
        if TwitterShareComponent.canIShareUsingThisChannel() {
            let twitterComponent = TwitterShareComponent()
            list.append(twitterComponent)
        }
        
        return list
    }
}
