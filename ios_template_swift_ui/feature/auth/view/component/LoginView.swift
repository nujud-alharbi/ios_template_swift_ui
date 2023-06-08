//
//  LoginView.swift
//  ios_template_swift_ui
//
//  Created by Hanan Asiri on 19/11/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct LoginView: View {
    
    @State var email =  UserDefaults.standard.string(forKey :  "email") ?? ""
    @State var password = ""
    @Namespace var animation
    @State var transition: Int? = 0
    @State private var isOn = (UserDefaults.standard.string(forKey :  "remmber") == "1") ?
    true : false
    @State var show = false
    let authService = AuthService()
    @State var isPresenting = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            customTextField(image: "envelope", title: "Enter your Email", value: $email,animation: animation)
        customTextField(image: "lock", title: "Enter your Password", value: $password,animation: animation)
        
            
            
            Button {
             }
            label: {
            Label("Forget password?", systemImage: "")
            .padding(.all , 15 )
            }
            NavigationLink(destination: LoginView(), isActive: $isPresenting) { EmptyView() }
            
            
            Button(action:{
                self.isOn.toggle()
               if(isOn == true){
              
              
//                                  isOn = true
                                  UserDefaults.standard.set("1", forKey: "remmber")
                                  UserDefaults.standard.set(email, forKey: "email")
                                 
                  print(isOn)
                    email = UserDefaults.standard.string(forKey :  "email") ?? ""
                    print(  UserDefaults.standard.string(forKey :  "email") ?? "")
                   
            
                              }else {
              
              email = ""
//                                  isOn = false
                                  print(email)
                                   UserDefaults.standard.string(forKey :  "email") ?? ""
                                  UserDefaults.standard.set("2", forKey: "remmber")
                                  print(  UserDefaults.standard.set("2", forKey: "remmber"))
//                                 email = ""
//                                  isOn = false
                              }
                
                
//
                   }) {
                       HStack(alignment: .center, spacing: 10) {
                           Image(systemName: self.isOn ? "checkmark.square" : "square")
                               .renderingMode(.original)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 20, height: 20)
                               .padding()
                           Text("Remmber Me")
//                               .font(Font.system(size: size))
                           Spacer()
                       }.foregroundColor(Color.black)
                   }
                   .foregroundColor(Color.white)
    

        }
//
            Button(action: {

                authService.LoginWithEmail(email: email, password: password) { result, error in
                    if let error = error {
                        print ("error \(error.localizedDescription)")
                        return
                    }
        
                    print("success")
                }

           })
            {
                
                HStack(spacing: 50){
                Text("Login")
                .fontWeight(.heavy)
                .font(.system(size: 25, weight: .heavy))
                        
             }
                
             }
        
        
            .padding(.all)
            
           VStack {
            
            SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "telephone")), text: Text("Sign in with Phone"))
            SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
            SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google"))
            
        }
        
       
        
        HStack(spacing: 16.0){
                
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                    .padding(.top, 37.0 )
                
           // NavigationLink(destination: Register(show: $show), isActive: $show) {
            Text("sign up")
                    .fontWeight(.heavy)
                    .padding(.top, 37.0 )
        }
        }
        }


