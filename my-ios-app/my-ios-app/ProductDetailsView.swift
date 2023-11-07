//
//  ProductDetailsView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI

import SwiftUI

struct CustomProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing)
                .frame(height: 10)
                .cornerRadius(5)
            
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                
                GeometryReader { geometry in
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width * CGFloat(progress), height: 10)
                        .cornerRadius(5)
                }
                
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.white)
                    .padding(.trailing, 8)
            }
        }
    }
}


struct SandboxView: View {
    @State private var carbonMeter = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var progress: Double = 0.5
    var body: some View {
        ProgressView("Carbon Meter", value: carbonMeter, total: 100)
            .onReceive(timer) { _ in
                if carbonMeter < 100 {
                    carbonMeter += 2
                }
            }
        
        CustomProgressBar(progress: $progress)
            .frame(height: 40)
            .padding(16)
        
        Button("Increase Progress") {
            withAnimation {
                progress += 0.1
            }
        }
    }
}

struct ProductDetailsView: View {
    var productCode: String
    var imageName: String

    var body: some View {
        VStack {
            Text("My Product Details")
            
            VStack {
                Image("iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 400)
                
                Text(productCode)
                    .font(.headline)
                    .padding(.top, 8)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            
            
            Text("Size: 21 x 29.7cm")
            
            Text("Carbon Waste avoided")
            Text("190g")
        }
        .padding()
        .background(Color.green)
    }
}

struct CustomTabView: View {
    @State private var currentPage = 0
    let pages: [ProductDetailsView] = [
        ProductDetailsView(productCode: "iPhone14", imageName: "iphone"),
        ProductDetailsView(productCode: "Salade", imageName: "iphone"),
        ProductDetailsView(productCode: "Tomate", imageName: "iphone"),
        ProductDetailsView(productCode: "Oignon", imageName: "iphone")
    ]

    var body: some View {
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
        CustomTabView()
    }
}
