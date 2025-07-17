//
//  Random.swift
//  Doggo
//
//  Created by Trey Gaines on 7/15/25.
//
import SwiftUI

struct Random: View {
    @Bindable var observe: Observe
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                
                VStack {
                    Spacer()
                    Button {
                        Task { await fetch() }
                    } label: {
                        Text("Find a new dog")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .fontWeight(.semibold)
                            .background {
                                RoundedRectangle(cornerRadius: 25).fill(Color.blue)
                            }
                    }
                }
            }
                .navigationTitle(Text("Find a Dog"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    
    func cleanSave() async {
        if let dog = observe.currentDog {
            modelContext.insert(dog)
        }; observe.currentDog = nil
    }
    
    func cleanRelease() { observe.currentDog = nil  }
    
    func fetch() async { await observe.fetchDog() }
}


#Preview {
    Random(observe: Observe())
}
