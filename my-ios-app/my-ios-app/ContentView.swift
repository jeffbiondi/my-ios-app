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
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Do you want to see my products?")
                }
            }
            .navigationBarTitle("First Screen")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
