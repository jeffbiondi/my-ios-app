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
                    .frame(width: 120, height: 120)
                Text(ProductViewModel.title)
                    .font(.headline)
                    .padding(.top, 8)
                    
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5)
        .padding()
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
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]) {
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
        }.padding(.top, 100).background(Color(UIColor(hex:"AD62F0"))).edgesIgnoringSafeArea(.all)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

extension UIColor {
  convenience init(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    var rgb: UInt64 = 0
    Scanner(string: hexSanitized).scanHexInt64(&rgb)
    let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgb & 0x0000FF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
}
