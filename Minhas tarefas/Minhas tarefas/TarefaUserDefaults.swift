//
//  TarefaUserDefaults.swift
//  Minhas tarefas
//
//  Created by Felipe on 28/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class TarefaUserDefaults {
    let chave = "listaTarefa"
    var tarefas:[String] = []
    
    func adicionarTarefa(tarefa:String){
        tarefas = listarTarefas()
        
        tarefas.append(tarefa)
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listarTarefas() -> Array<String> {
        let dados = UserDefaults.standard.object(forKey: chave)
        if dados != nil {
            return dados as! Array
        } else {
            return []
        }
        
    }
    
    func removerTarefa(indice: Int){
        tarefas = listarTarefas()
        tarefas.remove(at: indice)
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
}
