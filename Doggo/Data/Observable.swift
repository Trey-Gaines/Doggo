//
//  Observable.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI

@Observable
class Observe {
    
    
    var isDarkModeEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "darkMode")
        }
    }
    
    var preferredStyle: ColorScheme {
        if isDarkModeEnabled {
            .dark
        } else { .light }
    }
    
    init() {
        self.isDarkModeEnabled = UserDefaults.standard.object(forKey: "darkMode") as? Bool ?? true
    }
}
