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
            Tab("My Dogs", systemImage: "dog.fill") {
                Dogs()
            }
            
            Tab("Find A Dog", systemImage: "archivebox.fill") {
                Random()
            }
            
            Tab("Settings", systemImage: "gear") {
                Settings(observe: observable)
            }
        }
    }
}

#Preview {
    ContentView()
}
