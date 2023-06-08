//
//  CustomeTextField.swift
//  ios_template_swift_ui
//
//  Created by Hanan Asiri on 19/11/1444 AH.
//
import SwiftUI


struct customTextField: View {
    
    // Fields...
    var image: String
    var title: String
    @Binding var value: String
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 6){
            
            HStack(alignment: .bottom){
                Image(systemName: image)
                    .font(.system(size: 20))
                    .foregroundColor(value == "" ? .gray : .primary)
                    .frame(width: 35)
                VStack(alignment: .leading, spacing: 6) {
                    
                    if value != ""{
                        
                        Text(title)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                          //  .matchedGeometryEffect(id: title, in: animation)
                    }
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                        
                        if value == ""{
                            
                            Text(title)
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                                .matchedGeometryEffect(id: title, in: animation)
                        }
                        
                        if title == "PASSWORD"{
                            
                            SecureField("", text: $value)
                        }
                        else{
                            TextField("", text: $value)
                            // For Phone Number...
                                .keyboardType(title == "PHONE NUMBER" ? .numberPad : .default)
                        }
                        
                        }
                        }
                        }
            
            if value == ""{
                
                Divider()
            }
            }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("txt").opacity(value != "" ? 1 : 0))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(value == "" ? 0 : 0.1), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(value == "" ? 0 : 0.05), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.top)
        .animation(.linear)
    }
    }
