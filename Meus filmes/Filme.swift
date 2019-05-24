//
//  Filme.swift
//  Meus filmes
//
//  Created by Felipe on 23/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class Filme {
    var titulo:String!
    var descricao:String!
    var imagem:UIImage!
    
    init(titulo: String, descricao: String) {
        self.titulo = titulo
        self.descricao = descricao
    }
}
