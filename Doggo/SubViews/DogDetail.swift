//
//  DogDetail.swift
//  Doggo
//
//  Created by Trey Gaines on 7/16/25.
//

import SwiftUI

struct DogDetail: View {
    var dog: Doggo
    
    var body: some View {
        VStack {
            Text(dog.name)
                .font(.headline)
        }
    }
}
