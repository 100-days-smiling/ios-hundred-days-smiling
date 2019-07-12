//
//  AppContainer.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 12/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject

class AppContainer {
    
    let container: Container
    
    init(with container: Container) {
        self.container = container
    }
    
    func setupContainer() {
        AuthenticationContainer().setupContainer(with: container)
    }
}
