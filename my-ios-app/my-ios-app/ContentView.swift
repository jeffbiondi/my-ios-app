//
//  ContentView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI
struct ProductBlockView: View {
    var body: some View {
        NavigationView{
            NavigationLink {
                ProductBlockView()
            } label: {
                VStack {
                    Image("iphone") // Replace "iphone" with the name of your image asset
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100) // Adjust the size as needed

                    Text("iPhone X") // Replace "iPhone X" with your product title
                        .font(.headline)
                        .padding(.top, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("C'est sympa!")
            ProductBlockView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
