//
//  CustomText.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 28/11/1444 AH.
//

import Foundation
import SwiftUI

struct CustomText: View {
    var title : String
    @Binding var value: String
    var body: some View {
      
        TextField(title, text: $value, axis: .vertical)
            .lineLimit(3, reservesSpace: true)
            .padding()
            .foregroundColor(Color.black)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        
    }
}
