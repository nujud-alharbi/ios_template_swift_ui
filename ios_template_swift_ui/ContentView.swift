//
//  ContentView.swift
//  ios_template_swift_ui
//
//  Created by Nujud Alalawi on 18/11/1444 AH.
//
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State var isPicerShowing = false
    @State var data: Data?

    var body: some View {
        VStack {
            
            Button{
                isPicerShowing = true
            } label: {
                Text("Slected image")
            }
                
        }
        .sheet(isPresented: $isPicerShowing ,onDismiss: nil) {
            
//            ImagePicer()
            //image picer
          }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


