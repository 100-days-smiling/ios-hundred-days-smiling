//
//  APITwitterService.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 09/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import OAuthSwift

class APITwitterService {
    
    let oauthSwift: OAuth1Swift!
    
    init() throws {
        guard let parameters = Bundle.main.path(forResource: "TwitterCredentials", ofType: "plist")?.stringDict() else {
            throw NSError(domain: "failed.load.twitter.credentials", code: 666, userInfo: nil)
        }
        oauthSwift = OAuth1Swift(parameters: parameters)
    }
    
    func requestAuthotization() {
        
        oauthSwift.authorizeURLHandler = OAuthSwiftOpenURLExternally.sharedInstance
        let _ = oauthSwift.authorize(
        withCallbackURL: URL(string: "http://oauthswift.herokuapp.com/callback/twitter")!) { [weak self] result in
            switch result {
            case .success(let (credential, _, _)):
                
                #if DEBUG
                    self?.showTokenAlert(name: "Twitter", credential: credential)
                    self?.testTwitter(self?.oauthSwift)
                #endif
            case .failure(let error):
                print(error.description)
            }
        }
    }
    
    #if DEBUG
    func testTwitter(_ oauthswift: OAuth1Swift?) {
        let _ = oauthswift?.client.get("https://api.twitter.com/1.1/statuses/mentions_timeline.json", parameters: [:]) { result in
            switch result {
            case .success(let response):
                let jsonDict = try? response.jsonObject()
                print(String(describing: jsonDict))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showTokenAlert(name: String, credential: OAuthSwiftCredential) {
        var message = "oauth_token:\(credential.oauthToken)"
        if !credential.oauthTokenSecret.isEmpty {
            message += "\n\noauth_token_secret:\(credential.oauthTokenSecret)"
        }
        debugPrint("Token for Twitter")
        debugPrint("Message secret: \(message)")
    }
    #endif
}
