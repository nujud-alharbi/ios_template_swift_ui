//
//  ProductListView.swift
//  ios_template_swift_ui
//
//  Created by Ahlam Abdullah on 22/11/1444 AH.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

struct Product: Identifiable, Decodable, Hashable {
    
    @DocumentID var docID: String?
    let id: String
    let name: String
    let price: String
    let description: String
    let imageURL: String
}

struct ProductListView: View {
    
    @State private var items: [Product] = []
    @State private var networking: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    Section {
                        NavigationLink {
                            ProductEditView(item: item)
                        } label: {
                            HStack {
                                if let url = URL(string: item.imageURL) {
                                    AsyncImage(url: url) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                        } else {
                                            ZStack {
                                                ProgressView()
                                            }
                                            .frame(width: 80, height: 80)
                                        }
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                        Spacer()
                                        Text(item.price)
                                        Spacer()
                                        Text(item.description)
                                    }
                                    Spacer()
                                    VStack {
                                        Button {
                                            delete(item: item)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                        .buttonStyle(.plain)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            .overlay(
                ZStack {
                    NavigationLink {
                        ProductAddView()
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .disabled(networking)
                }
                    .padding(.bottom,15)
                    .padding(.trailing,15)
                ,alignment: .bottomTrailing
            )
            
        }
        .onAppear {
            load()
        }
    }
    
    private func load() {
        let db = Firestore.firestore()
        Task {
            do {
                networking = true
                let snapshot = try await db.collection("products").getDocuments()
                items = try snapshot.documents.map { try $0.data(as: Product.self) }
                networking = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func delete(item: Product) {
        let imageRef = Storage.storage().reference(forURL: item.imageURL)
        let db = Firestore.firestore()
        Task {
            do {
                networking = true
                try await imageRef.delete()
                print("deleted")
                try await db.collection("products").document(item.id).delete()
                if let index = items.firstIndex(of: item) {
                    items.remove(at: index)
                }
                networking = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}





struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
