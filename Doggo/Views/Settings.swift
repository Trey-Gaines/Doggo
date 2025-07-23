//
//  Settings.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import SwiftUI
import SwiftData

struct Settings: View {
    @Bindable var observe: Observe
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Cat.adopted) var cats: [Cat]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Appearance")) {
                    if observe.isDarkModeEnabled {
                        Toggle("Dark Mode", systemImage: "moon.fill", isOn: $observe.isDarkModeEnabled)
                    } else {
                        Toggle("Light Mode", systemImage: "sun.min.fill", isOn: $observe.isDarkModeEnabled)
                    }
                }
                
                Section(header: Text("Data")) {
                    Button(role: .destructive) {
                        observe.signedIn = false
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Sign Out of \(observe.signedInEmail)")
                        }
                    }.disabled(!observe.signedIn)
                    
                    Button(role: .destructive) {
                        do {
                            try modelContext.delete(model: Cat.self)
                        } catch { print("Failed to clear all adoptions: \(error)") }
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Release All Adopted Cats")
                        }
                    }.disabled(cats.count < 1)
                }
            }
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Settings(observe: Observe())
        .modelContainer(for: Cat.self, inMemory: true)
}


