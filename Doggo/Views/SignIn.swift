//
//  SignIn.swift
//  Doggo
//
//  Created by Trey Gaines on 7/23/25.
//

import SwiftUI


struct SignIn: View {
    @Bindable var observe: Observe
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
            TabView {
                Tab("Sign In", systemImage: "person.fill.checkmark") {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.systemGray))
                            .ignoresSafeArea()
                        VStack {
                            Text("Welcome to MyCats")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            HStack {
                                TextField("Username", text: $username)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                                
                            }.padding(.horizontal, 20)
                            
                            HStack {
                                SecureField("Password", text: $password)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                            }.padding(.horizontal, 20)
                            
                            Text("Enter your credentials")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Button {
                                observe.signIn(username.lowercased(), password.lowercased())
                            } label: {
                                Text("Sign In")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue))
                            }.padding()
                        }
                    }.alert("Sign In Error", isPresented: $observe.error, actions: {
                        Button(role: .destructive) {
                            username = ""
                            password = ""
                        } label: {
                            Text("Clear All")
                        }
                        
                    }, message: {
                        Text("\(observe.errorMessage)")
                    })
                }
                
                Tab("Sign Up", systemImage: "person.badge.plus") {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.systemGray))
                            .ignoresSafeArea()
                        VStack {
                            Text("Welcome to MyCats")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            HStack {
                                TextField("Username", text: $username)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                                
                            }.padding(.horizontal, 20)
                            
                            HStack {
                                SecureField("Password", text: $password)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.white))
                            }.padding(.horizontal, 20)
                            
                            Text("Create your profile")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Button {
                                observe.signUp(username.lowercased(), password.lowercased())
                            } label: {
                                Text("Sign Up")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue))
                            }.padding()
                        }
                    }.alert("Sign Up Error", isPresented: $observe.error, actions: {
                        Button(role: .destructive) {
                            username = ""
                            password = ""
                        } label: {
                            Text("Clear All")
                        }
                        
                    }, message: {
                        Text("\(observe.errorMessage)")
                    })
                }
            }
        
    }
}
