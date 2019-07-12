//
//  AuthenticationContainer.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 10/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import Swinject

class AuthenticationContainer {
    
    func setupContainer(with container: Container) {
        
        container.register(APITwitterService.self) { _ -> APITwitterService in
            let twitterService = try? APITwitterService()
            return twitterService!
        }
    }
}
