//
//  Model.swift
//  PokemonApp
//
//  Created by Rober on 01-08-22.
//

import Foundation

struct PokemonDataModel : Decodable {
    let name: String
    let url: String
}

struct PokemonResponseDataModel : Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
    case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
