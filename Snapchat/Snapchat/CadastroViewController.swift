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
                                if usuario == nil {
                                    self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problemas. Tente novamente")
                                } else {
                                    self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                                }
                            } else {
                                let erroR = erro! as NSError
                                let indice = "FIRAuthErrorUserInfoNameKey"
                                if let codigoErro = erroR.userInfo[indice] {
                                    let erroTexto = codigoErro as! String
                                    var mensagemErro = ""
                                    switch erroTexto {
                                        case "ERROR_INVALID_EMAIL":
                                            mensagemErro = "E-mail inválido, digite um e-mail válido"
                                            break
                                        case "ERROR_WEAK_PASSWORD":
                                            mensagemErro = "Senha precisa ter no mínimo 6 caracteres, com letras e números"
                                            break
                                        case "ERROR_EMAIL_ALREADY_IN_USE":
                                            mensagemErro = "Esse e-mail já está sendo utilizado, crie sua conta com outro"
                                            break
                                        default:
                                            mensagemErro = "Dados incorretos"
                                    }
                                    self.exibirMensagem(titulo: "Dados inválidos", mensagem: mensagemErro)
                                }
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
