//
//  FeatureButtonCrud .swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 28/11/1444 AH.
//

import Foundation
import SwiftUI

struct FeatureButtonCrud: View {
    var body: some View {
        NavigationLink{
        }
        
    label:{
        
    Text("user ")
   .font(.headline)
   .foregroundColor(.white)
   .padding()
   .frame(width: 325, height: 55)
   .background(Color.black)
   .cornerRadius(10)

    }
        
        NavigationLink{
          ProductScreen()
            
        }
        
    label:{
        
        
        Text("admin ")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 325, height: 55)
            .background(Color.black)
            .cornerRadius(10)
        
    }
      
        
    }
}

struct Feature_Button_Crud_Previews: PreviewProvider {
    static var previews: some View {
        FeatureButtonCrud()
    }
}

