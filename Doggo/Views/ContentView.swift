//
//  ContentView.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(Observe.self) var observable
    var body: some View {
        TabView {
            Tab("My Cats", systemImage: "cat.fill") {
                Cats()
            }
            
            Tab("Find A Cat", systemImage: "archivebox.fill") {
                Random(observe: observable)
            }
            
            Tab("Settings", systemImage: "gear") {
                Settings(observe: observable)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Observe())
}
