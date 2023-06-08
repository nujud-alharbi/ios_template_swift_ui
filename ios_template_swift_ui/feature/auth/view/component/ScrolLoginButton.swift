//
//  ScrolllLoginButton.swift
//  ios_template_swift_ui
//
//  Created by Hanan Asiri on 19/11/1444 AH.
//
import SwiftUI
struct SocalLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
                .padding(.horizontal)
            Spacer()
            text
                .font(.headline)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 10, y: 10)
    }
    }
