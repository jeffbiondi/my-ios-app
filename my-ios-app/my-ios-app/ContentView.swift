//
//  ContentView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ProductsView()) {
                VStack {
                    Image(systemName: "globe.americas")
                        .font(.system(size:100))
                        .foregroundColor(.green)
                    Text("Do you want to see my products?")
                        .font(.system(size:24, weight: .bold))
                        .foregroundColor(.green)
                }
            }
            .navigationBarTitle("Engage App")
            .foregroundColor(.green)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
