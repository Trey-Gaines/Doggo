//
//  Dogs.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import SwiftUI
import SwiftData

struct Cats: View {
    @Query(sort: \Cat.adopted) var cats: [Cat]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cats) { cat in
                    ZStack {
                        NavigationLink(destination: CatDetail(cat: cat)) {
                            EmptyView()
                        }.opacity(0)
                        CatCard(cat: cat)
                    }
                }
            }
            .listStyle(.plain)
                .navigationBarTitle("Cats")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
