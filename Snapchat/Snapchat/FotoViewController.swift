//
//  FotoViewController.swift
//  Snapchat
//
//  Created by Felipe on 15/08/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import FirebaseStorage

class FotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagem: UIImageView!
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var botaoProximo: UIButton!
    @IBAction func selecionarFoto(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func proximoPasso(_ sender: Any) {
        self.botaoProximo.isEnabled = false
        self.botaoProximo.setTitle("Carregando...", for: .normal)
        
        let armazenamento = Storage.storage().reference()
        let imagens = armazenamento.child("imagens")
        
        if let imagemSelecionada = imagem.image {
            if let imagemDados = imagemSelecionada.jpegData(compressionQuality: 0.5) {
                imagens.child("imagem.jpg").putData(imagemDados, metadata: nil, completion: { (metaDados, erro) in
                    if erro == nil {
                        print("sucesso")
                        
                        self.botaoProximo.isEnabled = true
                        self.botaoProximo.setTitle("Próximo", for: .normal)
                    } else {
                        print("erro")
                    }
                })
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagem.image = imagemRecuperada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var descricao: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
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
