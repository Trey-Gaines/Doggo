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
    @Query(sort: \Doggo.adopted) var dogs: [Doggo]
    
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
                        do {
                            try modelContext.delete(model: Doggo.self)
                        } catch { print("Failed to clear all adoptions: \(error)") }
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Release All Dogs Adopted")
                        }
                    }.disabled(dogs.count > 1)
                }
            }
            
            .navigationTitle(Text("Settings"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Settings(observe: Observe())
        .modelContainer(for: Doggo.self, inMemory: true)
}



