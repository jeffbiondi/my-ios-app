//
//  ProductDetailsView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI

struct ProductDetailsItemView: View {
    var productCode: String
    var imageName: String

    var body: some View {
        VStack {
            Text(productCode)
                .font(.largeTitle)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 400)
        }
        .padding()
        .background(Color.green)
    }
}

struct CarbonFootprint: View {
    var body: some View {
        VStack {
            Text("90% better than new")
                .font(.system(size: 50))
                .padding()
            
            Text("NEW: 72 kg of CO2")
                .font(.title)
                .padding()
            Text("Refurbished: 15.7 kg of CO2")
                .font(.title)
                .padding()
        }
    }
}

struct EWaste: View {
    var body: some View {
        VStack {
            Text("A single refurbished smartphone prevents 6.29 oz (178.2 g) of e-waste")
                .padding()
                .font(.system(size: 50))
            
            Text("Each brand new smartphone generates about 7.06 oz (200.2 g) of e-waste. A refurbished smartphone, just 0.78 oz (22 g) — that’s 89% less!")
                .padding()
                .font(.title)
        }
    }
}

struct ProductDetailsView: View {
    @State private var currentPage = 0
    var productCode: String
    var imageName: String
    
    var body: some View {
        let pages: [some View] = [
            AnyView(ProductDetailsItemView(productCode: productCode, imageName: imageName)),
            AnyView(CarbonFootprint()),
            AnyView(EWaste())
        ]


        TabView(selection: $currentPage) {
            ForEach(0..<pages.count, id: \.self) { index in
                pages[index]
                    .tag(index)
                    .gesture(
                        DragGesture(minimumDistance: 10)
                            .onEnded { value in
                                if value.translation.width < 0 {
                                    if currentPage < pages.count - 1 {
                                        currentPage += 1
                                    }
                                } else if value.translation.width > 0 {
                                    if currentPage > 0 {
                                        currentPage -= 1
                                    }
                                }
                            }
                    )
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .background(Color.green)
    }
}


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productCode: "iPhone 14", imageName: "iphone")
    }
}
