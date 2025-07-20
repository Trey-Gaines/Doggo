//
//  objA.swift
//  Doggo
//
//  Created by Trey Gaines on 7/17/25.
//

import Foundation

extension Cat {
    static func returnObjA() async -> Cat {
        let json = """
                [
                    {
                        "breeds": [
                            {
                                "weight": { "imperial": "7 - 14", "metric": "3 - 6" },
                                "id": "esho",
                                "name": "Exotic Shorthair",
                                "cfa_url": "http://cfa.org/Breeds/BreedsCJ/Exotic.aspx",
                                "vetstreet_url": "http://www.vetstreet.com/cats/exotic-shorthair",
                                "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/exotic-shorthair",
                                "temperament": "Affectionate, Sweet, Loyal, Quiet, Peaceful",
                                "origin": "United States",
                                "country_codes": "US",
                                "country_code": "US",
                                "description": "The Exotic Shorthair is a gentle friendly cat",
                                "life_span": "12 - 15",
                                "indoor": 0,
                                "lap": 1,
                                "alt_names": "Exotic",
                                "adaptability": 5,
                                "affection_level": 5,
                                "child_friendly": 3,
                                "dog_friendly": 3,
                                "energy_level": 3,
                                "grooming": 2,
                                "health_issues": 3,
                                "intelligence": 3,
                                "shedding_level": 2,
                                "social_needs": 4,
                                "stranger_friendly": 2,
                                "vocalisation": 1,
                                "experimental": 0,
                                "hairless": 0,
                                "natural": 0,
                                "rare": 0,
                                "rex": 0,
                                "suppressed_tail": 0,
                                "short_legs": 0,
                                "wikipedia_url": "https://en.wikipedia.org/wiki/Exotic_Shorthair",
                                "hypoallergenic": 0,
                                "reference_image_id": "YnPrYEmfe"
                            }
                        ],
                        "id": "2N4PhyqTG",
                        "url": "https://cdn2.thecatapi.com/images/2N4PhyqTG.jpg",
                        "width": 800,
                        "height": 600
                    }
                ]
                """.data(using: .utf8)!
        let example = try? JSONDecoder().decode([ACat].self, from: json).first
        
        if let cat = example {
            var myImageData: Data = Data()
            
            do {
                let (imageData, _) = try await URLSession.shared.data(from: URL(string: "\(cat.url)")!)
                myImageData = imageData
            } catch { print("Failed to fetch cat image: \(error.localizedDescription)")  }
            return Cat(cat, myImageData)
        } else {
            let breed = Breeds(weight: Weight(imperial: "", metric: ""), id: "", name: "", temperament: "", origin: "")
            let aCat = ACat(breeds: [breed], id: "", url: "")
            return Cat(aCat, Data())
        }
        
    }
}
