//
//  ViagensUserDefaults.swift
//  Minhas viagens
//
//  Created by Felipe on 30/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import UIKit

class ViagensUserDefaults {
    let chave = "listaViagens"
    var viagens:[String] = []
    
    func adicionarViagem(viagem:String){
        viagens = listarViagens()
        
        viagens.append(viagem)
        UserDefaults.standard.set(viagens, forKey: chave)
    }
    
    func listarViagens() -> Array<String> {
        let dados = UserDefaults.standard.object(forKey: chave)
        if dados != nil {
            return dados as! Array
        } else {
            return []
        }
        
    }
    
    func removerViagem(indice: Int){
        viagens = listarViagens()
        viagens.remove(at: indice)
        UserDefaults.standard.set(viagens, forKey: chave)
    }
}
