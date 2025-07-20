//
//  DogCard.swift
//  Doggo
//
//  Created by Trey Gaines on 7/16/25.
//

//Need random color gen

import SwiftUI

struct CatCard: View {
    var cat: Cat
    let catImg = UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 14.0)))
    
    var cardColor: Color {
        Color.random()
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(cardColor)
            HStack {
                ContentUnavailableView("No at", systemImage: "cat")
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 125)
                    .background {
                        RoundedRectangle(cornerRadius: 25).fill(.blue)
                    }
                Spacer()
                VStack {
                    Text("\(cat.name!)")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .frame(alignment: .topTrailing)
                    Spacer().frame(height: 10)
                        
                    HStack {
                        if let descr = cat.descr {
                            Text(descr)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        }
                    }
                }.padding(.all, 8)
            }
            
            
            HStack {
                if let imgData = cat.imgData {
                    if let uiImage = UIImage(data: imgData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 125)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    } else {
                        ContentUnavailableView("No Cat Image", systemImage: "cat.fill")
                            .foregroundStyle(.white)
                            .frame(width: 150, height: 125)
                            .background {
                                RoundedRectangle(cornerRadius: 25).fill(Color(Color(.systemGray)))
                            }
                    }
                } else {
                    ContentUnavailableView("No Cat Image", systemImage: "cat")
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 125)
                        .background {
                            RoundedRectangle(cornerRadius: 25).fill(Color(.systemGray))
                        }
                }
                Spacer()
            }
        }.frame(maxWidth: 350, maxHeight: 125)
    }
}

#Preview {
    CardRowPreviewWrapper()
}

struct CardRowPreviewWrapper: View {
    @State private var cat: Cat? = nil
    
    var body: some View {
        Group {
            if let cat = cat {
                CatCard(cat: cat)
            } else {
                ProgressView("Loading Preview...")
                    .preferredColorScheme(.dark)
            }
        }
        .task {
            if cat == nil {
                cat = await Cat.returnObjA()
            }
        }
    }
}
