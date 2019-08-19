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
    var idImagem = NSUUID().uuidString
    @IBAction func selecionarFoto(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func proximoPasso(_ sender: Any) {
        self.botaoProximo.isEnabled = false
        self.botaoProximo.setTitle("Carregando...", for: .normal)
        
        let armazenamento = Storage.storage().reference()
        let imagens = armazenamento.child("imagens")
        
        if let imagemSelecionada = imagem.image {
            if let imagemDados = imagemSelecionada.jpegData(compressionQuality: 0.1) {
                imagens.child("\(self.idImagem).jpg").putData(imagemDados, metadata: nil, completion: { (metaDados, erro) in
                    if erro == nil {
                        imagens.child("\(self.idImagem).jpg").downloadURL(completion: { (url, erro) in
                            if(erro == nil) {
                                if let urlR = url?.absoluteString {
                                    self.performSegue(withIdentifier: "selecionarUsuarioSegue", sender: urlR)
                                    self.botaoProximo.isEnabled = true
                                    self.botaoProximo.setTitle("Próximo", for: .normal)
                                }
                            }else{
                                print(erro!);
                            }
                        })
                    } else {
                        let alerta = Alerta(titulo: "Upload falhou", mensagem: "Erro ao salvar arquivo")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selecionarUsuarioSegue" {
            let usuarioViewController = segue.destination as! UsuariosTableViewController
            usuarioViewController.descricao = self.descricao.text!
            usuarioViewController.urlImagem = sender as! String
            usuarioViewController.idImagem = self.idImagem
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagem.image = imagemRecuperada
        
        self.botaoProximo.isEnabled = true
        self.botaoProximo.backgroundColor = UIColor(red: 0.553, green: 0.369, blue: 0.749, alpha: 1)
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var descricao: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        botaoProximo.isEnabled = false
        botaoProximo.backgroundColor = UIColor.gray
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
