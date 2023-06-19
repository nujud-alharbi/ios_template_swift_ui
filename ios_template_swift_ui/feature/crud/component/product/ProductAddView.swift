//
//  ProductAddView.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 22/11/1444 AH.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

struct ProductAddView : View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var nameProduct = ""
    @State var priceProduct = ""
    @State var descriptionProduct = ""
    @State var showImagePicker = false
    @State var imageUploaded = false
    @State var networking = false
    @State var showErrorAlert = false
    @State var alertMessage = ""
    @State var imageURL: String = ""
    @State private var image: UIImage? = nil
    

    
    private func uploadImage(img: UIImage) {
        // firebase storage
        let storageRef = Storage.storage().reference().child(UUID().uuidString)
        var metadata = StorageMetadata()
        //networking = true
        metadata.contentType = "image/jpeg"
        guard let imgData = img.jpegData(compressionQuality: 0.2) else { return }
        let result = storageRef.putData(imgData, metadata: metadata) { metadata, error in
            let _ = storageRef.downloadURL { url, error in
                //networking = false
                imageURL = url!.absoluteString
                imageUploaded = true
                print("uploaded")
            }
        }
    }
    
    private func validate() -> Bool {
        
        if nameProduct.isEmpty {
            showErrorAlert = true
            alertMessage = "Please Enter Name"
            return false
        }
        if priceProduct.isEmpty {
            showErrorAlert = true
            alertMessage = "Price Can't Be Empty"
            return false
        }

        if descriptionProduct.isEmpty {
            showErrorAlert = true
            alertMessage = "description Can't Be Empty"
            return false
        }
        
        if imageURL.isEmpty {
            showErrorAlert = true
            alertMessage = "Select Image"
            return false
        }

        return true
    }
    
    @MainActor
    private func add() {
        if !validate() { return }
        
        let db = Firestore.firestore()
        networking = true
        Task {
            do {
                let id = UUID().uuidString
                
                _ = try await db.collection("products").document(id).setData([
                    "id": id,
                    "name": nameProduct,
                    "price": priceProduct,
                    "description": descriptionProduct,
                    "imageURL": imageURL
                ])
                
                dismiss()
                networking = false
                
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text("Name Product *")) {
                    TextField("Name Product", text: $nameProduct)
                }
                
                Section (header: Text("Price Product *")) {
                    TextField("Price Product", text: $priceProduct)
                }
                
                Section (header: Text("Description Product *")){
                    TextField("Description Product", text: $descriptionProduct, axis: .vertical).lineLimit(3, reservesSpace: true)
                        .lineLimit(4)
                
                }
            }
            
            .disabled(networking)
            
            if let image = image {
                Image(uiImage: image)
                .resizable()
                
            } else {
                Button(action: { showImagePicker.toggle() } ) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            Spacer()
        }
        
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(uiImage: $image, isPresenting: $showImagePicker, sourceType: .constant(.photoLibrary))
        }
    )
        
        .onChange(of: image, perform: { newValue in
            if let img = newValue {
                uploadImage(img: img)
        
            }
        })
        .toolbar {
            ToolbarItem {
                Button("Save", action: add)
            }
        }
        .alert(alertMessage, isPresented: $showErrorAlert, actions: {
            Button(action: {}) {
                Text("Dismiss")
            }
        })
    }
}

struct ProductAdd : PreviewProvider {
    static var previews: some View {
        ProductAddView()
    }
}


