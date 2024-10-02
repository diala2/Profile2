//
//  Splash.swift
//  Profile2
//
//  Created by May Bader Alotaibi on 29/03/1446 AH.
//

import SwiftUI

struct goal: View {
    @State var goal : String = ""
    var body: some View {
        

    
                NavigationView {
                    VStack(spacing: 54) {
                        
                        // Spacer to push the content upwards
                        Spacer(minLength: 20)
                        
                        
                        Image("3D 1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 160)
                            .padding(.top, 10)
                        
                        // Goal Input Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Enter your monthly goal:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            TextField("e.g. 1000", text: $goal)
                                .padding()
                                .tint(.blue)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .keyboardType(.numberPad) // Set keyboard type for numeric input
                        }
                        .padding(.horizontal)
                        
                        // Button Section
                        NavigationLink(destination: NextView(goal: goal)) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 280 ,height: 50)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .cornerRadius(10)
                              
                        }
                        .padding(.top, 40)
                        
                        Spacer()
                    }
                   
                    .padding()
                }
            }
        }

      
        struct NextView: View {
            var goal: String
            
            var body: some View {
                VStack {
                    Text("Your goal is \(goal)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                }
                .navigationTitle("Next Step")
            }
        }

        // Preview
        #Preview {
            ContentView()
        }

     
