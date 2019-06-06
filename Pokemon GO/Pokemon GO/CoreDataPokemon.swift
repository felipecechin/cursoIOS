//
//  CoreDataPokemon.swift
//  Pokemon GO
//
//  Created by Felipe on 06/06/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon {
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context!
    }
    
    func adicionarTodosPokemons() {
        self.criarPokemon(nome: "Mew", nomeImagem: "mew", capturado: false)
        self.criarPokemon(nome: "Mankey", nomeImagem: "mankey", capturado: false)
        self.criarPokemon(nome: "Rattata", nomeImagem: "rattata", capturado: false)
        self.criarPokemon(nome: "Pidgey", nomeImagem: "pidgey", capturado: false)
        self.criarPokemon(nome: "Pikachu", nomeImagem: "pikachu-2", capturado: true)
        
        let context = self.getContext()
        do {
            try context.save()
        } catch{
            
        }
        
    }
    
    func criarPokemon(nome: String, nomeImagem: String, capturado: Bool) {
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.nomeImagem = nomeImagem
        pokemon.capturado = capturado
    }
    
    
    func recuperarTodosPokemons() -> [Pokemon] {
        let context = self.getContext()
        
        do {
            let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
            
            if pokemons.count == 0 {
                self.adicionarTodosPokemons()
                return self.recuperarTodosPokemons()
            }
            return pokemons
        } catch{}
        
        return []
    }
}
