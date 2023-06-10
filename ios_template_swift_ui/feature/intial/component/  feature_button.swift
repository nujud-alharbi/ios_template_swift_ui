//
//    FeatureButton.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 21/11/1444 AH.
//

import SwiftUI

struct FeatureButton: View {
    var body: some View {
        
     
        
        NavigationLink{
            SignUp()
        }
    label:{


Text("Auth ")
   .font(.headline)
   .foregroundColor(.white)
   .padding()
   .frame(width: 325, height: 55)
   .background(Color.black)
   .cornerRadius(10)

    }
        
     
        NavigationLink{
            
        }
    label:{
        
        
        Text("CRUD ")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 325, height: 55)
            .background(Color.black)
            .cornerRadius(10)
        
    }
      
        
        
        
        
        
    }
}

struct FeatureButton_Previews: PreviewProvider {
    static var previews: some View {
        FeatureButton()
    }
}
