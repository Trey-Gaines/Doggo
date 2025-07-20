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
    @State var foundCat: Bool = false
    
    var body: some View {
        NavigationStack {
            Group {
                if foundCat {
                    ContentUnavailableView("You found a cat!", image: "cat.fill")
                } else {
                    ZStack {
                        if observe.currentCat != nil {
                            VStack {
                                Text("\(observe.currentCat?.name ?? "")")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .padding()
                                AsyncImage(url: URL(string: "\(observe.currentCat!.url)")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity)
                                        .clipShape(RoundedRectangle(cornerRadius: 40))
                                } placeholder: {
                                    Color.gray
                                }
                                
                                
                                Spacer()
                                HStack(spacing: 30) {
                                    Button {
                                        modelContext.insert(observe.currentCat!)
                                        observe.currentCat = nil
                                        foundCat = true
                                    } label: {
                                        Text("Keep this cat")
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                            .padding()
                                            .fontWeight(.semibold)
                                            .background {
                                                RoundedRectangle(cornerRadius: 25).fill(Color.blue)
                                            }
                                    }
                                    
                                    Button {
                                        observe.currentCat = nil
                                    } label: {
                                        Text("Release this cat")
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                            .padding()
                                            .fontWeight(.semibold)
                                            .background {
                                                RoundedRectangle(cornerRadius: 25).fill(Color.red)
                                            }
                                    }
                                }.padding(.horizontal, 8)
                            }
                            
                        } else {
                            VStack {
                                Spacer()
                                Button {
                                    print("Clicked")
                                    Task { await fetch() }
                                } label: {
                                    Text("Find a new cat")
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                        .padding()
                                        .fontWeight(.semibold)
                                        .background {
                                            RoundedRectangle(cornerRadius: 25).fill(Color.blue)
                                        }
                                    
                                }
                                .padding()
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    
                }
            }
            .navigationTitle(Text("Find a Cat"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                foundCat = false
            }
        }
    }
    
    
    
    //    func cleanSave() async {
    //        if let dog = observe.currentDog {
    //            modelContext.insert(dog)
    //        }; observe.currentDog = nil
    //    }
    //
    //    func cleanRelease() { observe.currentDog = nil  }
    
    func fetch() async { await observe.fetchCat() }
}


#Preview {
    Random(observe: Observe())
}
