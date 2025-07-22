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
    @State var signedIn: Bool = false
    @State var showSheet: Bool = false
    
    
    var body: some View {
        NavigationStack {
            if signedIn {
                Text("SignedIN")
            }
            
            List {
                Section(header: Text("Appearance")) {
                    if observe.isDarkModeEnabled {
                        Toggle("Dark Mode", systemImage: "moon.fill", isOn: $observe.isDarkModeEnabled)
                    } else {
                        Toggle("Light Mode", systemImage: "sun.min.fill", isOn: $observe.isDarkModeEnabled)
                    }
                }
                
                Section(header: Text("Data")) {
                    Button {
                        showSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "person")
                            Text("Sign In")
                        }
                    }.disabled(signedIn)
                    
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
        .sheet(isPresented: $showSheet) { SignIn() }
    }
}

#Preview {
    Settings(observe: Observe())
        .modelContainer(for: Cat.self, inMemory: true)
}

struct SignIn: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(Color.green)
                .ignoresSafeArea()
            VStack {
                Text("Enter your credentials")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                HStack {
                    TextField("Username", text: $username)
                        .foregroundStyle(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                    
                }.padding(.horizontal, 20)
                
                HStack {
                    SecureField("Password", text: $password)
                        .foregroundStyle(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                }.padding(.horizontal, 20)
                
                Button {
                    
                } label: {
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue))
                }.padding()
            }
        }
    }
}
