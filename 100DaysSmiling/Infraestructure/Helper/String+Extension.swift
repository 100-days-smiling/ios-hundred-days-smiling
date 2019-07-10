//
//  String+Extension.swift
//  100DaysSmiling
//
//  Created by Felipe Florencio Garcia on 09/07/2019.
//  Copyright © 2019 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

extension String {

    func stringDict() -> Dictionary<String, String>? {
        guard let dictionary = NSDictionary(contentsOfFile: self) as? [String: String] else {
            return nil
        }
        return dictionary
    }
}
