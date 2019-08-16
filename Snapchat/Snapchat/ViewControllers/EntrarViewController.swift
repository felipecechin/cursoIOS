//
//  EntrarViewController.swift
//  Snapchat
//
//  Created by Felipe on 11/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBAction func entrar(_ sender: Any) {
        if let emailR = self.email.text {
            if let senhaR = self.senha.text {
                let autenticacao = Auth.auth()
                autenticacao.signIn(withEmail: emailR, password: senhaR, completion: { (usuario, erro) in
                    if erro == nil {
                        if usuario == nil {
                            let alerta = Alerta(titulo: "Erro", mensagem: "Erro ao logar")
                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                        } else {
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                    } else {
                        let alerta = Alerta(titulo: "Erro", mensagem: "Erro ao logar")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
