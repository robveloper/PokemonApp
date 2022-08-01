//
//  ViewModel.swift
//  PokemonApp
//
//  Created by Rober on 01-08-22.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonDataModel] = []
    
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.pokemons
                }
            }
        }.resume()
    }
    
}
