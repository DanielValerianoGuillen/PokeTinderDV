//
//  HomeViewModel.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=50"
    
    let db = Firestore.firestore()
    
    @Published var pokemons = [Result]()
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    var pokemonsFirebase = [Result]()
    
    func loadData() async {
        do {
            let url = URL(string: url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Pokemon.self, from: data)
            
            // aca vamos a comparar los pokemones de firebase con los del api
            // si encontramos uno en firebase este no deberia mostrarse en la vista
            for pokemon in response.results {
                if !pokemonsFirebase.contains(where: {$0.name == pokemon.name}) {
                    self.pokemons.append(pokemon)
                }
            }
            
        } catch let error {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
    
    func getPokemonByUserId() {
        let uid = Auth.auth().currentUser?.uid
        
        db.collection("pokemon").getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            for document in querySnapshot!.documents {
                let data = document.data()
                if data["uid"] as? String == uid {
                    // vamos a guardar los pokemones en otro array
                    self.pokemonsFirebase.append(Result(name: data["name"] as! String, url: data["url"] as! String))
                }
            }
            
            Task {
                await self.loadData()
            }
        }
    }
    
    func savePokemon(name: String, url: String, like: Bool = false) {
        let uid = Auth.auth().currentUser?.uid
        
        db.collection("pokemon").addDocument(data: [
            "name": name,
            "url" : url,
            "uid" : String(uid!),
            "like": like
        ]) { error in
            self.showError = true
            self.errorMessage = error?.localizedDescription ?? "no-error"
        }
    }
    
}

