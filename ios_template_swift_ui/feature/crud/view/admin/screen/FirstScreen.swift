//
//  FirstScreen.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 28/11/1444 AH.
//

import Foundation
import SwiftUI




struct FirstScreen : View {
    var body: some View {
        VStack{
           
            FeatureButtonCrud()
            
        }
    }
}

struct firstScreenCrud_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}

