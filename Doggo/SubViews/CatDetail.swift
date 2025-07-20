//
//  DogDetail.swift
//  Doggo
//
//  Created by Trey Gaines on 7/16/25.
//

import SwiftUI
import SafariServices

struct CatDetail: View {
    var cat: Cat
    
    var name: String {
        if let name = cat.name {
            name
        } else { "Cat name not found" }
    }
    
    var temperament: String {
        if let temperament = cat.temperament {
            temperament
        } else { "Temperament not found" }
    }
    
    var validWikiLink: Bool {
        if cat.wikipediaUrl != nil {
            return true
        } else { return false }
    }
    
    var wikiLink: URL {
        if validWikiLink {
            return URL(string: cat.wikipediaUrl!)!
        } else { return URL(string: "https://www.google.com")!}
    }
    
    var desc: String {
        if let desc = cat.descr {
            desc
        } else { "No description available"  }
    }
    
    var weightImp: String {
        if let weightImp = cat.weightImperial {
            weightImp
        } else { "N/A" }
    }
    
    var weightMet: String {
        if let weightMet = cat.weightMetric {
            weightMet
        } else { "N/A" }
    }
    
    var lifeSpan: String {
        if let lifeSpan = cat.lifeSpan {
            lifeSpan
        } else { "N/A" }
    }
    
//    var origin: String?
//    var countryCode: String?
//    var altNames: String?
    
    var origin: String {
        if let origin = cat.origin {
            origin
        } else { "N/A" }
    }
    
    var countryCode: String {
        if let countryCode = cat.countryCode {
            countryCode
        } else { "N/A" }
    }
    
    var altNames: String {
        if let altNames = cat.altNames {
            altNames
        } else { "N/A" }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("\(temperament)")
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 2)
                if let imgData = cat.imgData, let uiImage = UIImage(data: imgData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    ContentUnavailableView("No Cat Image", systemImage: "cat.fill")
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 125)
                        .background {
                            RoundedRectangle(cornerRadius: 25).fill(Color(Color(.systemGray)))
                        }
                }
                
                HStack {
                    VStack {
                        Text("Imperial Weight")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Text("\(weightImp) lbs")
                    }
                    Spacer()
                    VStack {
                        Text("LifeSpan")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Text("\(lifeSpan) years")
                    }
                    Spacer()
                    VStack {
                        Text("Metric Weight")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Text("\(weightMet) kgs")
                    }
                }.padding(.horizontal, 8)
                
                Spacer()
                    .frame(height: 30)
                Text(desc)
                    .font(.title2)
                    .padding(.horizontal, 8)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 30)
                VStack {
                    HStack {
                        VStack {
                            Text("Origin")
                                .fontWeight(.semibold)
                                .font(.title3)
                            Text("\(origin)")
                        }
                        Spacer()
                        VStack {
                            Text("Country Code")
                                .fontWeight(.semibold)
                                .font(.title3)
                            Text("\(countryCode)")
                        }
                    }.padding(.horizontal, 8)
                    Spacer().frame(height: 10)
                    VStack {
                        Text("Alt Names")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Text("\(altNames)")
                    }
                    Spacer().frame(height: 10)
                }
            }
            .navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        openSafariView(url: wikiLink)
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                    }.disabled(!validWikiLink)
                }
            }
        }
    }
    
    func openSafariView(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let rootVC = windowScene.windows.first?.rootViewController {
                rootVC.present(safariVC, animated: true, completion: nil)
            }
        }
    }
}

#Preview {
    DetailPreviewWrapper()
}

struct DetailPreviewWrapper: View {
    @State private var cat: Cat? = nil
    
    var body: some View {
        Group {
            if let cat = cat {
                CatDetail(cat: cat)
                    .preferredColorScheme(.dark)
            } else {
                ProgressView("Loading Preview...")
                    .preferredColorScheme(.dark)
            }
        }
        .task {
            if cat == nil { cat = await Cat.returnObjA() }
        }
    }
}

