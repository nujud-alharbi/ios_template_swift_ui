//
//  RestPassView.swift
//  ios_template_swift_ui
//
//  Created by Hanan Asiri on 19/11/1444 AH.
//


import SwiftUI
import Firebase

struct ResetPasswordView: View {
  

  
  @State var email: String = ""
  @State var confirmPassword : String = ""
    let authService = AuthService()
    
  
  var body: some View {
    ZStack {
      
      // Background Color
      Color.white
        .ignoresSafeArea(edges: .all)
      
      // Main View
      VStack {
        
        // Fields
        VStack(spacing: 20) {
          TextField("Email", text: $email, prompt: Text("Enter email..."))
            .font(.title2)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
          
        }
        .padding()
        .padding(.bottom, 8.0)
        
        // Buttons
        VStack(spacing: 16) {
            
            Button(action: {
                let auth = Auth.auth()
                auth.sendPasswordReset(withEmail: email) { (error) in
                    if let error = error {
                     //   self.alert.showAlert(with: "Error", message: "Email not found" , on: self)
                        return
                        
                    }
                    print("success")
                  //  self.navigationController?.pushViewController(LoginVC(), animated: true)
                    }
                      }) {
                    Text("Send")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                             
                      }
          .padding()
          .foregroundColor(.white)
          .background(Color.black)
          .cornerRadius(16)
          
        }
        .padding()
        
        Spacer()
        
      }
      
    }
    // Title
  .navigationTitle("Reset Password")
  }
  }

struct ResetPasswordView_Previews: PreviewProvider {
  static var previews: some View {
    ResetPasswordView()
  }
  }
