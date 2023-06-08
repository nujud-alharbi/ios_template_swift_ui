//
//  CustomSecureFieldView.swift
//  templete_ios_swiftui
//
//  Created by Nujud Alalawi on 17/11/1444 AH.
//

import SwiftUI

struct CustomSecureFieldView: View {
    var title : String
    @Binding var value: String
    var body: some View {
        SecureField(title, text: $value)
            .padding()
            .foregroundColor(Color.black)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .frame(height: 75)
    }
}


