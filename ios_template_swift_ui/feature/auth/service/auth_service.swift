//
//  auth_service.swift
//  templete_ios_swiftui
//
//  Created by Nujud Alalawi on 08/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class AuthService {
    
    func LoginWithEmail(email:String, password:String, complition :@escaping(Bool ,Error? ) -> Void){
        
        var userAuth = Auth.auth().signIn(withEmail: email, password: password , completion: { (result, error) in
            if let error = error{
                complition(false , error)
                return
            }
            guard let resultUser = result?.user else{
                complition(false , nil)
                return
            }
            complition(true ,nil)
        })
    }
    
    
    func signUpWithEmail(email:String, password:String, displayName:String  , complition :@escaping(Bool ,Error? ) -> Void){
        
        var userAuth =     Auth.auth().createUser(withEmail: email, password: password)
        
        { (result, error) in
            
            if let error = error{
                complition(false , error)
                return
            }
            
            guard let resultUser = result?.user else{
                complition(false , nil)
                return
                
            }
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = displayName
            changeRequest?.commitChanges { (error) in
                complition(false , error)
                return
            }
            print(changeRequest?.displayName)
            
            complition(true ,nil)
        }
    }
    
    
    func Phone_Login(){ }
    
    func Google_Login(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) {  result, error in
            guard error == nil else {
                return          }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return          }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential){result, error in
                
                guard error == nil else
                {
                    return
                }
                print("sign in")
            }
        }
        //    public func
    }
    func getRootViewController()-> UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else
        {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return . init()
            
        }
        return root
    }
    
}
    
    
    

