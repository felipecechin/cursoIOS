//
//  PokemonAnotacao.swift
//  Pokemon GO
//
//  Created by Felipe on 13/06/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation {
    
    var pokemon: Pokemon
    var coordinate: CLLocationCoordinate2D
    
    init(coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordenadas
        self.pokemon = pokemon
    }
    
}
