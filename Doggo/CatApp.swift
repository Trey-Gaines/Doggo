//
//  DoggoApp.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}



@main
struct CatApp: App {
    @State var observe = Observe()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Cat.self
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
            if !observe.signedIn {
                SignIn(observe: observe)
            } else {
                ContentView()
                    .environment(observe)
                    .preferredColorScheme(observe.preferredStyle)
            }
        }.modelContainer(sharedModelContainer)
    }
}
