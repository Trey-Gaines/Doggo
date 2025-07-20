//
//  Model.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import Foundation
import SwiftData
import SwiftUI

struct ACat: Codable {
    var breeds: [Breeds]
    var id: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case breeds
        case id
        case url
    }
    
}

struct Breeds: Codable {
    var weight: Weight
    var id: String
    var name: String
    var cfaUrl: String?
    var vetstreetUrl: String?
    var temperament: String
    var origin: String
    var countryCodes: String?
    var countryCode: String?
    var description: String?
    var lifeSpan: String?
    var indoor: Int?
    var lap: Int?
    var altNames: String?
    var adaptability: Int?
    var affectionLevel: Int?
    var childFriendly: Int?
    var dogFriendly: Int?
    var energyLevel: Int?
    var grooming: Int?
    var healthIssues: Int?
    var intelligence: Int?
    var sheddingLevel: Int?
    var socialNeeds: Int?
    var strangerFriendly: Int?
    var vocalisation: Int?
    var experimental: Int?
    var hairless: Int?
    var natural: Int?
    var rare: Int?
    var rex: Int?
    var supressedTail: Int?
    var shortLegs: Int?
    var wikipediaUrl: String?
    var hypoallergenic: Int?
    var referenceImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case weight
        case id
        case name
        case cfaUrl = "cfa_url"
        case vetstreetUrl = "vetstreet_url"
        case temperament
        case origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor
        case lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation
        case experimental
        case hairless
        case natural
        case rare
        case rex
        case supressedTail = "supressed_tail"
        case shortLegs = "short_legs"
        case wikipediaUrl = "wikipedia_url"
        case hypoallergenic
        case referenceImageUrl = "reference_image_id"
    }
}

struct Weight: Codable {
    var imperial: String
    var metric: String
}


@Model
class Cat {
    var adopted: Date
    var url: String
    
    var name: String?
    var temperament: String?
    var weightMetric: String?
    var weightImperial: String?
    var origin: String?
    var countryCode: String?
    var referenceImageId: String?
    var altNames: String?
    var wikipediaUrl: String?
    var lifeSpan: String?
    var imgData: Data?
    var descr: String?
    
    
    init(_ cat: ACat, _ imageData: Data?) {
        self.adopted = .now
        self.url = cat.url
        self.imgData = imageData
        
        if let breedInfo = cat.breeds.first {
            self.weightMetric = breedInfo.weight.metric
            self.weightImperial = breedInfo.weight.imperial
            self.temperament = breedInfo.temperament
            self.name = breedInfo.name
            self.origin = breedInfo.origin
            
            if let myCode = breedInfo.countryCode {
                self.countryCode = myCode
            }
            
            if let lifeSpan = breedInfo.lifeSpan {
                self.lifeSpan = lifeSpan
            }
            
            if let altNames = breedInfo.altNames {
                self.altNames = altNames
            }
            
            if let wikiLink = breedInfo.wikipediaUrl {
                self.wikipediaUrl = wikiLink
            }
            
            if let refImageId = breedInfo.referenceImageUrl {
                self.referenceImageId = refImageId
            }
            
            if let desc = breedInfo.description {
                self.descr = desc
            }
        }
    }
}

