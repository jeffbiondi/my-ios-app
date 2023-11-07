//
//  ProductsView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI
struct ProductBlockView: View {
    var imageName: String
    var title: String
    var productCode: String

    var body: some View {
        NavigationLink(destination: ProductDetailsView(productCode: productCode, imageName: imageName)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

                Text(title)
                    .font(.headline)
                    .padding(.top, 8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProductsView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            HStack {
                ProductBlockView(
                    imageName: "iphone",
                    title: "iPhone X",
                    productCode: "iphone-x"
                )

                ProductBlockView(
                    imageName: "ipad",
                    title: "iPad Pro",
                    productCode: "ipad-pro"
                )
                // Add more ProductBlockViews as needed
            }
            .navigationTitle("Product List")
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

