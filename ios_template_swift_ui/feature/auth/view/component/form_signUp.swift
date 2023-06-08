//
//  FormSignUp.swift
//  templete_ios_swiftui
//
//  Created by Nujud Alalawi on 08/11/1444 AH.
//

import SwiftUI


struct FormSignUp: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isChecked = false
    @State var hidde = false
    
    var body: some View {
        
        Text("Sign Up")
            .font(.title)
            .fontWeight(.bold)
        
        CustomTextFieldView(title: "Name" ,value: $name)
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
                        print("kjjjjj")
                        hidde.toggle()
                        
                    }){
                        
                        Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill").offset(x: -20 , y :0)
                        
                    }.offset(x: -45 , y :0)
                    
                    
                }.offset(x : 15 ,y : 0)
            }
            
            
            
            ZStack{
                HStack{
                    
                    Group{
                        if (self.hidde){
                            CustomTextFieldView(title :"ConfirmPassword", value: $confirmPassword)
                                .frame(width: UIScreen.main.bounds.width - 2)
                            
                        }
                        
                        
                        
                        else{
                            CustomSecureFieldView(title: "ConfirmPassword", value: $confirmPassword)
                                .frame(width: UIScreen.main.bounds.width - 2)
                        }
                        
                        
                        Button(action:{
                            print("kjjjjj")
                            hidde.toggle()
                            
                        }){
                            
                            Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill").offset(x: -20 , y :0)
                            
                        }.offset(x: -45 , y :0)
                        
                        
                    }.offset(x : 15 ,y : 0)
                }}
            
            VStack{
                
                
                Button ( action :{
                    print("sign up")
                    //                print(name)
                    //                print(password)
                    sginUp(name: name, email: email, password: password, confirmPassword: confirmPassword)
                    
                },
                         label:{
                    
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 325, height: 55)
                        .background(Color.black)
                        .cornerRadius(10)
                }).frame(height : 70)
                
                HStack{
                    Text("Already have an account?")
                        .padding(.vertical, 20)
                    NavigationLink(
                        destination: LoginView()
                    ) {
                        Text("Log in")
                .font(.headline)
                .foregroundColor(.black)                    } 
                }
            }
        }
    }
    


struct FormSignUp_Previews: PreviewProvider {
    static var previews: some View {
        FormSignUp()
        
    }
    
    
}



func sginUp(name : String ,email : String , password: String ,confirmPassword : String) {
    
    let authService = AuthService()
    if (name != "" && name != nil )
        
        
    {
        if(password == confirmPassword){
            //
            authService.signUpWithEmail(email: email, password: password, displayName: name) { wasRegisterd, error  in
                if let error = error {
                    
                    
                    print (error.localizedDescription)
                    //                     self.alert.showAlert(with: "LOGIN FIELD", message: error.localizedDescription, on: self)
                    
                    
                    return
                }
                
                print ("wasRegisterd" , wasRegisterd)
                //                self.navigationController?.popViewController(animated: true)
            }
        }else {
            print("please same password")
            //            alert.showAlert(with:  "LOGIN FIELD", message: "please same password", on: self)
            //
        }
        
    }else{
        print("please inter name")
        //        alert.showAlert(with: "LOGIN FIELD", message: "please inter name" , on: self)
        
    }
    
}






