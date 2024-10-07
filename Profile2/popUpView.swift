//
//  popUpView.swift
//  Profile2
//
//  Created by Wajd Wael on 03/04/1446 AH.
//

import SwiftUI

struct popUpView: View {
    
    @Binding var isShowing: Bool
    @State private var checkAmount = 0
    @State private var spendings = ""
        
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                // Background overlay
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
    
    var mainView: some View {
        Form {
            Section {
                VStack (spacing: 25) {
                    VStack{
                        Image(systemName: "fork.knife.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
                        Text("Enter your spedings")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                    VStack (spacing: 15) {
                        TextField("Enter spednigs", text: $spendings)
                            .foregroundColor(Color(red: 109 / 255, green: 109 / 255, blue: 109 / 255))
                            .padding()
                            .background(Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(red: 168/225, green: 168 / 255, blue: 168/225, opacity: 0.23), lineWidth: 2))
                        
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(Color(red: 109 / 255, green: 109 / 255, blue: 109 / 255))
                            .padding()
                            .background(Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(red: 168/225, green: 168 / 255, blue: 168/225, opacity: 0.23), lineWidth: 2))
                            .keyboardType(.decimalPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        dismissKeyboard()
                                    }
                                }
                            }
                        
                        HStack(){
                            Button("Cancle") {
                                withAnimation {
                                    isShowing = false
                                }
                            }
                            .foregroundColor(.blue)
                            .frame(width: 118, height: 45)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))
                            .font(.system(size: 18))
                            Spacer()
                            Button("update") {}
                                .foregroundColor(.white)
                                .frame(width: 118, height: 45)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
                                .font(.system(size: 18))
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
        .scrollContentBackground(.hidden)
        .ignoresSafeArea()
        .frame(height: 650)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: 650 / 2)
            }.foregroundColor(.white)
        )
        .padding(.bottom, -35)
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    popUp()
}
