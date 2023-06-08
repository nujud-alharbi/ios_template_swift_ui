//
//  PhoneNumber.swift
//  templete_ios_swiftui
//
//  Created by razan aljohani on 17/11/1444 AH.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct PhoneNumberView: View {
    @State var ccode = "+966"
      @State var no = ""
      @State var show = false
      @State var msg = ""
      @State var alert = false
      @State var ID = ""
      
      var body : some View{
          
          VStack(spacing: 20){
              
              Image("pic")
              
              Text("Verify Your Number").font(.largeTitle).fontWeight(.heavy)
              
              Text("Please Enter Your Number To Verify Your Account")
                  .font(.body)
                  .foregroundColor(.gray)
                  .padding(.top, 12)
              
              HStack{
                  
                  TextField("+966", text: $ccode)
                      .keyboardType(.numberPad)
                      .frame(width: 45)
                      .padding()
                      .background(Color("Color"))
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                     
                  
                  TextField("Number", text: $no)
                      .keyboardType(.numberPad)
                      .padding()
                      .background(Color("Color"))
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  
              } .padding(.top, 15)

              NavigationLink(destination: OtpView(show: $show, ID: $ID), isActive: $show) {
                  
                  
                  Button(action: {
                      
                      PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (ID, err) in
                          
                          if err != nil{
                              
                              self.msg = (err?.localizedDescription)!
                              self.alert.toggle()
                              return
                          }
                          
                          self.ID = ID!
                          self.show.toggle()
                      }
                      
                      
                  }) {
                      
                      Text("Send").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                      
                  }.foregroundColor(.white)
                  .background(Color.black)
                  .cornerRadius(10)
              }

              .navigationBarTitle("")
              .navigationBarHidden(true)
              .navigationBarBackButtonHidden(true)
              
          }.padding()
          .alert(isPresented: $alert) {
                  
              Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
          }
      }
  }
