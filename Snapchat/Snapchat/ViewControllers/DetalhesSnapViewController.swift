//
//  DetalhesSnapViewController.swift
//  Snapchat
//
//  Created by Felipe on 18/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class DetalhesSnapViewController: UIViewController {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var detalhes: UILabel!
    @IBOutlet weak var contador: UILabel!
    var snap = Snap()
    var tempo = 11
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalhes.text = "Carregando..."
        let url = URL(string: snap.urlImagem)
        imagem.sd_setImage(with: url) { (imagem, erro, cache, url) in
            if erro == nil {
                self.detalhes.text = self.snap.descricao
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                    self.tempo = self.tempo - 1
                    self.contador.text = String(self.tempo)
                    
                    if self.tempo == 0 {
                        timer.invalidate()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let autenticacao = Auth.auth()
        if let idUsuarioLogado = autenticacao.currentUser?.uid {
            let database = Database.database().reference()
            let usuarios = database.child("usuarios")
            let snaps = usuarios.child(idUsuarioLogado).child("snaps")
            snaps.child(snap.identificador).removeValue()
            
            
            let storage = Storage.storage().reference()
            let imagens = storage.child("imagens")
            
            imagens.child("\(snap.idImagem).jpg").delete { (erro) in
                if erro == nil {
                    print("sucesso")
                } else {
                    print("erro")
                }
            }
        }
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
