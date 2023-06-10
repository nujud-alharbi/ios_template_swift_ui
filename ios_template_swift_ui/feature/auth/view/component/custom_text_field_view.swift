//
//  custom_text.swift
//  templete_ios_swiftui
//
//  Created by Nujud Alalawi on 17/11/1444 AH.
//

import SwiftUI

struct CustomTextFieldView: View {
    var title : String
    @Binding var value: String
    var body: some View {
        TextField(title, text: $value)
            .padding()
            .foregroundColor(Color.black)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .frame(height: 75)
    }
}


