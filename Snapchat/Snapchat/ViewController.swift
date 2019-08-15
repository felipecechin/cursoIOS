//
//  ViewController.swift
//  Snapchat
//
//  Created by Felipe on 06/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let autenticacao = Auth.auth()
        autenticacao.addStateDidChangeListener({ (autenticacao, usuario) in
            if let usuarioLogado = usuario {
                self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

