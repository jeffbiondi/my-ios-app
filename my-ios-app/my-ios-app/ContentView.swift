//
//  ContentView.swift
//  my-ios-app
//
//  Created by Jean-Francois BIONDI on 07/11/2023.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ProductsView()) {
                VStack() {
                    Text("Engage with Us")
                        .frame(height: 100)
//                        .border(.red)
                        .font(.system(size:24, weight: .bold))
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            LottieView(animationView:
                                        LottieAnimationView(name: "earth_spinning"), loopMode: .loop)
                            .frame(width: 150, height: 150)
                        }
                        
                        Text("Do you want to see my products?")
                            .font(.system(size:24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(30)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.green.cornerRadius(15)
                        .shadow(radius: 5))
                    .padding()
                    
                }
//                .border(.red)
            }
//            .border(.yellow)
            //            .navigationBarTitle("")
                .foregroundColor(.green)
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarHidden(true)
//        .border(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

