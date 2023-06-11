//
//  form_login.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 21/11/1444 AH.
//

import SwiftUI

struct FormLogin: View {
    @State var email =  UserDefaults.standard.string(forKey :  "email") ?? ""
    @State var password = ""
    @Namespace var animation
    @State var transition: Int? = 0
    @State private var isOn = (UserDefaults.standard.string(forKey :  "remmber") == "1") ?
    true : false
    @State var show = false
    let authService = AuthService()
    @State var isPresenting = false
    
    @State var hidde = false
    
    
    var body: some View {
        
        
        Text("Login")
            .font(.title)
            .fontWeight(.bold)
        
        
        CustomTextFieldView(title: "Email" ,value: $email)
        
        HStack{
            
            Group{
                if (self.hidde){
                    CustomTextFieldView(title :"Password", value: $password)
                        .frame(width: UIScreen.main.bounds.width - 2)
                    
                }else{
                    CustomSecureFieldView(title: "Password", value: $password)
                        .frame(width: UIScreen.main.bounds.width - 2)
                    
                }
                
                
                Button(action:{
                    
                    hidde.toggle()
                    
                }){
                    
                    Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill").offset(x: -20 , y :0)
                    
                }.offset(x: -45 , y :0)
                
                
            }.offset(x : 15 ,y : 0)
        }
        
        
        Button {
        }
    label: {
        Label("Forget password?", systemImage: "")
            .padding(.all , 15 )
    }
        NavigationLink(destination: ResetPasswordView(), isActive: $isPresenting) { EmptyView() }
        
        
        Button(action:{
            self.isOn.toggle()
            if(isOn == true){
                
                
                //
                UserDefaults.standard.set("1", forKey: "remmber")
                UserDefaults.standard.set(email, forKey: "email")
                
                
                email = UserDefaults.standard.string(forKey :  "email") ?? ""
                print(  UserDefaults.standard.string(forKey :  "email") ?? "")
                
                
            }else {
                
                
                email = ""
              
             
               
                UserDefaults.standard.set("2", forKey: "remmber")
            
                UserDefaults.standard.set(email, forKey: "email")
                
                
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
        
        
        VStack{
            
            
            Button ( action :{
                print("sign up")
                
                authService.LoginWithEmail(email: email, password: password) { result, error in
                    if let error = error {
                        print ("error \(error.localizedDescription)")
                        return
                    }
                    
                    print("success")
                }
                
                
            },
                     label:{
                
                Text("Login ")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 325, height: 55)
                    .background(Color.black)
                    .cornerRadius(10)
            }).frame(height : 70)
            
            
            
            
            
        }
        
        
        
        
        VStack {
            
            NavigationLink(destination: PhoneNumberView()) {
                
                
                
                SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "telephone")), text: Text("Sign in with Phone").foregroundColor(.black))
            }
            SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
            
            
            
            //
            //                        SocalLoginButton(image:
            //                                            Image(uiImage: #imageLiteral(resourceName: "google")),
            //                                         text: Text("Sign in with Google"), action: authService.Google_Login());
            //
            //
            //
            //        }
            Button(action: {
                self.authService.Google_Login()
            }) {
                SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google").foregroundColor(.black))
            }
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


struct form_login_Previews: PreviewProvider {
    static var previews: some View {
        FormLogin()
    }
}
