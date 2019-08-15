//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Felipe on 15/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UIViewController {

    @IBAction func sair(_ sender: Any) {
        let autenticacao = Auth.auth()
        do {
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Erro")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
