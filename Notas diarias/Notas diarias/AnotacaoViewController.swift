//
//  AnotacaoViewController.swift
//  Notas diarias
//
//  Created by Felipe on 02/06/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {

    @IBOutlet weak var texto: UITextView!
    var gerenciadorObjetos: NSManagedObjectContext!
    var anotacao: NSManagedObject!
    
    @IBAction func salvar(_ sender: Any) {
        if (anotacao != nil) {
            self.atualizar()
        } else {
            
            self.metodoSalvar()
        }

        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gerenciadorObjetos = appDelegate.persistentContainer.viewContext
        
        self.texto.becomeFirstResponder()
        if (anotacao != nil) {
            self.texto.text = anotacao.value(forKey: "texto") as? String
        } else {
            self.texto.text = ""
        }
        
        
    }
    
    func atualizar() {
        anotacao.setValue(self.texto.text, forKey: "texto")
        anotacao.setValue(NSDate(), forKey: "data")
        do {
            try gerenciadorObjetos.save()
            print("sucesso ao atualizar")
        } catch let erro as NSError {
            print("Erro ao salvar ", erro.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metodoSalvar() {
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: gerenciadorObjetos)
        
        novaAnotacao.setValue(self.texto.text, forKey: "texto")
        novaAnotacao.setValue(NSDate(), forKey: "data")
        
        do {
            try gerenciadorObjetos.save()
            print("sucesso ao salvar")
        } catch let erro as NSError {
            print("Erro ao salvar ", erro.description)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
