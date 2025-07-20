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
    let catApiKey = "live_ZpCBmAo45Yb7R5WK6toqtESTN0KZfKwluZ2Nb0wnnxp08ygtfbYxYsaCdzHqwqTF"
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
    
    
    var currentCat: Cat?
    
    
    func fetchCat() async {
        var myCat: ACat?
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=1&has_breeds=1&api_key=\(catApiKey)") else { return }
        do {
            print("Entered")
            let (data, _) = try await URLSession.shared.data(from: url)
            print(String(data: data, encoding: .utf8)!)
            let cats = try JSONDecoder().decode([ACat].self, from: data)
            if let cat = cats.first { myCat = cat }
        } catch { print("Failed: \(error.localizedDescription)") }
        
        if let cat = myCat, let imageUrl = URL(string: cat.url) {
            do {
                let (imageData, _) = try await URLSession.shared.data(from: imageUrl)
                currentCat = Cat(cat, imageData)
            } catch { print("Failed to fetch cat image: \(error.localizedDescription)")  }
        }
    }
    
    
    init() {
        self.isDarkModeEnabled = UserDefaults.standard.object(forKey: "darkMode") as? Bool ?? true
    }
}
