//
//  ViewController.swift
//  Core Data
//
//  Created by Felipe on 30/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        /*let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: context)
        
        usuario.setValue("jamilton", forKey: "loginUsuario")
        usuario.setValue("senha123", forKey: "senha")
        usuario.setValue("Jamilton", forKey: "nome")
        usuario.setValue(25, forKey: "idade")
        
        
        do {
            try context.save()
            print("Dados salvos")
        } catch {
            
        }*/
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        let ordenacao = NSSortDescriptor(key: "nome", ascending: true)
        //let predicate = NSPredicate(format: "nome = %@", "Felipe Cechin")
        //let predicate2 = NSPredicate(format: "idade <= %@", "30")
        
        //let combinacao = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, predicate2])
        
        requisicao.sortDescriptors = [ordenacao]
        //requisicao.predicate = predicate
        do {
            let usuarios = try context.fetch(requisicao)
            if usuarios.count>0 {
                for usuario in usuarios as! [NSManagedObject] {
                    
                    let nomeUsuario = usuario.value(forKey: "nome")
                    let login = usuario.value(forKey: "loginUsuario")
                    print(String(describing: nomeUsuario) + " - " + String(describing: login))
                    
                    //deletar
                    /*context.delete(usuario)
                    do {
                        try context.save()
                        print("Sucesso")
                    } catch {
                        print("Erro")
                    }*/
                        /*atualizar
                        usuario.setValue("fikrip", forKey: "loginUsuario")
                        do {
                            try context.save()
                            print("Sucesso")
                        } catch {
                            print("Erro")
                        }*/
                    
                    
                }
            } else {
                print("sem usuarios")
            }
        } catch {
            print("erro")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

