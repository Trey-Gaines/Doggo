//
//  Model.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import Foundation
import SwiftData

struct Dog: Codable {
    var url: String
    var name: String
    var temperament: String
    var origin: String
    var lifeSpan: String
    var wikipediaUrl: String
    var weight: Weight
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case temperament
        case origin
        case lifeSpan = "life_span"
        case wikipediaUrl = "wikipedia_url"
        case weight
    }
}

struct Weight: Codable {
    var imperial: String
    var metric: String
}


@Model
class Doggo {
    var adopted: Date
    var url: String
    var name: String
    var temperament: String
    var origin: String
    var lifeSpan: String
    var wikipediaUrl: String
    var weightMetric: String
    var weightImperial: String
    
    init(dog: Dog) {
        self.adopted = .now
        self.url = dog.url
        self.name = dog.name
        self.temperament = dog.temperament
        self.origin = dog.origin
        self.lifeSpan = dog.lifeSpan
        self.wikipediaUrl = dog.wikipediaUrl
        self.weightMetric = dog.weight.metric
        self.weightImperial = dog.weight.imperial
    }
}

