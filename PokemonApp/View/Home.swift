//
//  Home.swift
//  PokemonApp
//
//  Created by Rober on 01-08-22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
         
        NavigationView {
            Form{
                ForEach(viewModel.pokemons, id:\.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            .navigationTitle("Poke App")
        }.onAppear{
            viewModel.getPokemons()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

