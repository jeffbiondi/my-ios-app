//
//  ProductDetailsView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI

struct ProductDetailsView: View {
    var productCode: String
    var imageName: String
    var body: some View {
        VStack {
            Text("My Product Details")
            Image(imageName) // Replace "iphone" with the name of your image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100) // Adjust the size as needed

            Text(productCode)
                .font(.headline)
                .padding(.top, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productCode: "iPhone14 Salade Tomate", imageName: "iphone")
    }
}
