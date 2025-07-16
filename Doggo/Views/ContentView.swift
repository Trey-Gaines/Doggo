//
//  ContentView.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("My Dogs", systemImage: "dog.fill") {
                Text("Doogs")
            }
            
            Tab("Find A Dog", systemImage: "archivebox.fill") {
                Text("Random")
            }
            
            Tab("Settings", systemImage: "gear") {
                Text("Settings")
            }
        }
    }
}

#Preview {
    ContentView()
}
