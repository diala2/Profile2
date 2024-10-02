//
//  Splash.swift
//  Profile2
//
//  Created by May Bader Alotaibi on 29/03/1446 AH.
//

import SwiftUI

struct Splash: View {
    @State var goal : String = ""
    var body: some View {
        
        
        Image("3dd")
            .padding(.bottom, 30)
        
        VStack {
   
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
            .frame(width: 280, height: 50)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
        }
        
        .padding()
    
  
    }
}

#Preview {
    Splash()
}
