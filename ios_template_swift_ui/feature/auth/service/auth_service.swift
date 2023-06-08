//
//  auth_service.swift
//  templete_ios_swiftui
//
//  Created by Nujud Alalawi on 08/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore


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
    
    func Google_Login(){}
    
    
    
    
    }
    
    

