//
//  AddProductScreen.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 28/11/1444 AH.
//

import Foundation
import SwiftUI


struct AddProductScreen : View {
   

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProductAddView()
        }
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddProductScreen()
    }
}

