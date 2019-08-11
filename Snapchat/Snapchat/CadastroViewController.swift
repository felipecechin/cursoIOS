//
//  CadastroViewController.swift
//  Snapchat
//
//  Created by Felipe on 11/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    func exibirMensagem(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acao = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func criarConta(_ sender: Any) {
        if let emailR = self.email.text {
            if let senha = self.senha.text {
                if let confirmarSenha = self.confirmarSenha.text {
                    if senha == confirmarSenha {
                        let usuario = Auth.auth()
                        usuario.createUser(withEmail: emailR, password: senha) { (usuario, erro) in
                            if erro == nil {
                                print("sucesso")
                            } else {
                                print("erro")
                            }
                        }
                    } else {
                        self.exibirMensagem(titulo: "Dados incorretos", mensagem: "Senhas não estão iguais, digite novamente.")
                    }
                }
            }
        }
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

}
