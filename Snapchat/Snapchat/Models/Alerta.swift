//
//  Alerta.swift
//  Snapchat
//
//  Created by Felipe on 16/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//
import UIKit

class Alerta{
    var titulo: String
    var mensagem: String
    
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta() -> UIAlertController {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acao = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acao)
        return alerta;
    }
    
    
}
