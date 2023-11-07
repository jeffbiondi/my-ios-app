//
//  ProductsView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI
struct ProductBlockView: View {
    @StateObject var ProductViewModel: ProductViewModel

    var body: some View {
        NavigationLink(destination: ProductDetailsView(productCode: ProductViewModel.productCode, imageName: ProductViewModel.imageName)) {
            VStack {
                Image(ProductViewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text(ProductViewModel.title)
                    .font(.headline)
                    .padding(.top, 8)
                    
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.trailing, 8)
        .opacity(ProductViewModel.isVisible ? 1.0 : 0.0)
        //.opacity(ProductViewModel.isVisible ? 1.0 : 0.0)
    }
}

class ProductViewModel: ObservableObject, Identifiable {
    
    var imageName: String
    var title: String
    var productCode: String
    var delay: Double // Delay for staggered appearance
    var id: String { title }
    
    @Published var isVisible = false
    
    init(imageName: String, title: String, productCode: String, delay: Double) {
        self.imageName = imageName
        self.title = title
        self.productCode = productCode
        self.delay = delay
    }
}

struct ProductsView: View {
    
    let products = [
        ProductViewModel(
            imageName: "iphone",
            title: "iPhone X",
            productCode: "iphone-x",
            delay: 0
        ),
        ProductViewModel(
            imageName: "samsung",
            title: "Samsung",
            productCode: "samsung",
            delay: 0.5
        ),
        ProductViewModel(
            imageName: "macbook",
            title: "MacBook",
            productCode: "macbook-pro",
            delay: 1
        ),
        ProductViewModel(
            imageName: "watch",
            title: "Apple Watch",
            productCode: "apple-watch",
            delay: 1.5
        ),
        ProductViewModel(
            imageName: "airpod",
            title: "AirPod",
            productCode: "airpod",
            delay: 2
        ),
        ProductViewModel(
            imageName: "ipad",
            title: "iPad Pro",
            productCode: "ipad-pro",
            delay: 2.5
        ),
        ProductViewModel(
            imageName: "dyson",
            title: "Dyson",
            productCode: "dyson-vaccum",
            delay: 3
        )
    ]
    var body: some View {
      
       
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]) {
                ForEach(products) { product in ProductBlockView(ProductViewModel: product)
                        .onAppear {

                            withAnimation(.easeInOut(duration: 0.5).delay(product.delay)) {
                                product.isVisible = true
                            }
                        }
                }
                //
            }
            Spacer()
            .navigationTitle("Product List")
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

