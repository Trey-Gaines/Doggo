//
//  Observable.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI

@Observable
class Observe {
    //i know this is bad practice
    let apiKey = "live_OzaDkvfl1qL7b0QNAa0rhnUcmJJcG0xquLC9XsYUpIC12N9neICpnrDh3Yg9RGJT"
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
    
    
    var currentDog: Doggo?
    
    
    func fetchDog() async {
        var myDog: Dog?
        
        
        if let dog = myDog { currentDog = Doggo(dog: dog) }
    }
    
    
    init() {
        self.isDarkModeEnabled = UserDefaults.standard.object(forKey: "darkMode") as? Bool ?? true
    }
}
