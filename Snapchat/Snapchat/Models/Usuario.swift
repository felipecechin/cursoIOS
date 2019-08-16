//
//  Usuario.swift
//  Snapchat
//
//  Created by Felipe on 16/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation

class Usuario {
    var email: String
    var nome: String
    var uid: String
    
    init (email:String, nome:String, uid: String) {
        self.email = email
        self.nome = nome
        self.uid = uid
    }
}
