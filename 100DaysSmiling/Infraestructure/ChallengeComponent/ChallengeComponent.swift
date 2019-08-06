//
//  ChallengeComponent.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 02/08/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class ChallengeComponent: NSObject {
    
    func challengeComplete() -> Bool {
        let howLong = Calculator.dayCount
        
        return howLong > 100
    }
    
    func completedChallenge(reset completed: @escaping () -> Void, continue noReset: (() -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: "Completed", message: "You already completed, congratulations, if you want to restart just click restart and will reset the counter", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            noReset?()
        }
        
        alertController.addAction(cancelAction)
        
        let reset = UIAlertAction(title: "Reset", style: .default) { _ in
            Calculator.reset()
            completed()
        }
        alertController.addAction(reset)
        
        return alertController
    }
    
}
