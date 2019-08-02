//
//  ViewController.swift
//  Configuracao Firebase
//
//  Created by Felipe on 30/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var pontuacao: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usuario = Auth.auth()
        
//        do {
//            try usuario.signOut()
//        } catch {
//            print("Erro ao deslogar")
//        }
        
//        usuario.signIn(withEmail: "ficechin@hotmail.com", password: "123456") { (usuario, erro) in
//            if erro == nil {
//                print("Sucesso ao logar")
//            } else {
//                print("Usuario nao logado" + String(describing: erro?.localizedDescription))
//            }
//        }
        
        usuario.addStateDidChangeListener { (autenticacao, usuario) in
            if let usuarioLogado = usuario {
                print("Usuario logado " + String(describing: usuarioLogado.email))
            } else {
                print("usuario nao esta logado")
            }
        }
        
        usuario.createUser(withEmail: "ficechin@hotmail.com", password: "123456") { (usuario, erro) in
            if erro == nil {
                print("usuario criado")
            } else {
                print("usuario nao foi criado" + String(describing: erro?.localizedDescription))
            }
        }
        
//        let pontuacao = database.child("pontuacao")
//        //pontuacao.setValue("200")
//        //pontuacao.removeValue()
//
//        pontuacao.observe(DataEventType.value) { (dados) in
//            print(dados)
//            if let pontos = dados.value {
//                print("oi")
//                self.pontuacao.text = String(describing: pontos)
//            }
//        }
        
//        let usuario = database.child("usuarios")
//        usuario.removeValue()
        // Do any additional setup after loading the view.
    }


}

