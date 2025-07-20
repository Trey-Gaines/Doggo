//
//  RadnomColor.swift
//  Doggo
//
//  Created by Trey Gaines on 7/20/25.
//

import SwiftUI

public extension Color {
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
