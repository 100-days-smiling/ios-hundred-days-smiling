//
//  ChallengeComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 02/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class ChallengeComponent: NSObject {
    
    func challengeComplete() -> Bool {
        let howLong = Calculator.dayCount
        
        return howLong >= 100
    }
    
}
