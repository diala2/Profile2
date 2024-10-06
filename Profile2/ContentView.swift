//
//  ContentView.swift
//  Profile2
//
//  Created by Diala Abdulnasser Fayoumi on 26/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, ")
            NavigationView{
                
                VStack (spacing :50){
                    
                    
                    Image("image1")
                    VStack{
                        Text("Wanna save some cash?")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Know where your money goes")
                            .font(.title3)
                            .foregroundColor(.color)
                            .padding(.trailing)
                    }
                    
                    NavigationLink(destination: Splash()){
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 280 ,height: 50)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        
                    }
                    
                    
                }
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
