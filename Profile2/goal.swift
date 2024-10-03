//
//  Splash.swift
//  Profile2
//
//  Created by May Bader Alotaibi on 29/03/1446 AH.
//

import SwiftUI

struct goal: View {
    @State private var goal: String = ""
        @State private var showAlert = false
        @State private var navigateToNextView = false
        @FocusState private var isTextFieldFocused: Bool

        var body: some View {
            NavigationView {
                ZStack {
                    VStack(spacing: 54) {
                        Spacer(minLength: 20)
                        
                    
                        Image("3D 1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 160)
                            .padding(.top, 10)
                        
                      
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Enter your monthly goal:")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            TextField("e.g. 1000", text: $goal)
                                .padding()
                                .tint(.blue)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .keyboardType(.numberPad)
                                .focused($isTextFieldFocused)
                        }
                        .padding(.horizontal)
                        
                      
                        Button(action: {
                            if goal.isEmpty {
                                showAlert = true
                                hideAlertWithDelay()
                            } else {
                                navigateToNextView = true
                                isTextFieldFocused = false // 3. Dismiss keyboard on button press
                            }
                        }) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 280, height: 50)
                                .background(goal.isEmpty ? Color.gray : Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.top, 40)
                        
                        Spacer()
                    }
                    .padding()
                    .navigationDestination(isPresented: $navigateToNextView) {
                        NextView(goal: goal)
                    }
                    
                    // Tap gesture to dismiss keyboard when tapping outside
                    .onTapGesture {
                        isTextFieldFocused = false // 4. Dismiss the keyboard on tap
                    }
                    
                    if showAlert {
                        VStack {
                            CustomAlertView(message: "Please enter a goal before proceeding.")
                                .transition(.move(edge: .top))
                            Spacer()
                        }
                        .zIndex(1)
                    }
                }
            }
        }
        
        // Function to auto-hide the alert after 2 seconds
        func hideAlertWithDelay() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showAlert = false
                }
            }
        }
    }

   
    struct CustomAlertView: View {
        var message: String
        
        var body: some View {
            VStack {
                Text(message)
                    .foregroundColor(.color2)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.color1)
                    .cornerRadius(15)
                    .padding(.top, 20)
            }
            .padding(.top, 10)
        }
    }

    // Next View to navigate to//
   // احذفي ذا ديالا
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

        #Preview {
            ContentView()
        }

     
