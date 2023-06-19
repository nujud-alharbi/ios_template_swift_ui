//
//  ProductScreen.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 28/11/1444 AH.
//

import Foundation
import SwiftUI



struct ProductScreen : View {
    var body: some View {
        VStack{
            ProductListView()
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}

