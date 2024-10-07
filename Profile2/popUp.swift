//
//  popUp.swift
//  Profile2
//
//  Created by Wajd Wael on 03/04/1446 AH.
//

import SwiftUI


struct popUp: View {
    @State private var showModal = false
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation{
                    showModal = true
                }
            }){
                HStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(Color("primaryBlue"))
                    
                    VStack(spacing: 5){
                        Text("Education")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color("darkBlue"))
                            .font(.system(size: 21))
                            .fontWeight(.semibold)
                        
                        Text("description")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color(.gray))
                            .font(.system(size: 16))
                        
                    }
                    .padding()
                }
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }
            popUpView(isShowing: $showModal)
        }
        
    }
}

#Preview {
    popUp()
}

