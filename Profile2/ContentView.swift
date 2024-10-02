//
//  ContentView.swift
//  Profile2
//
//  Created by Diala Abdulnasser Fayoumi on 26/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var goal : String = ""
    var body: some View {
       
            VStack (spacing:20){
                Image("3d")
                    .padding()
                
                
                Text("Enter your monthly goal:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                TextField("1000...", text: $goal)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.accentColor)
                    .tint(.blue)
                    .cornerRadius(10)
                
            }
            
            .padding()
            
            VStack{
                Button("Next"){
                    print(goal)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 300, height: 50)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            }
            
            .padding()
            
        }
        
    }

#Preview {
    ContentView()
}
