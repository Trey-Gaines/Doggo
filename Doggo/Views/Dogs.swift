//
//  Dogs.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import SwiftUI
import SwiftData

struct Dogs: View {
    @Query(sort: \Doggo.adopted) var dogs: [Doggo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dogs) { dog in
                    NavigationLink(destination: DogDetail(dog: dog)) {
                        Text(dog.name)
                    }
                }
            }
                .navigationBarTitle("Dogs")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
