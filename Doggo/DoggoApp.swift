//
//  DoggoApp.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI
import SwiftData

@main
struct DoggoApp: App {
    @State var observe = Observe()
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Doggo.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
                
                
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(observe)
                .preferredColorScheme(observe.preferredStyle)
        }.modelContainer(sharedModelContainer)
    }
}
