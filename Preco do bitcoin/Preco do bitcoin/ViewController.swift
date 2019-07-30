//
//  ViewController.swift
//  Preco do bitcoin
//
//  Created by Felipe on 30/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var botao: UIButton!
    
    @IBOutlet weak var precoBitcoin: UILabel!
    
    @IBAction func atualizarPreco(_ sender: Any) {
        self.recuperarPreco()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recuperarPreco()
    }
    
    func formatarPreco(preco: NSNumber) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        if let precoFinal = nf.string(from: preco) {
            return precoFinal
        }
        return "0,00"
    }
    
    func recuperarPreco() {
        
        self.botao.setTitle("Atualizando...", for: .normal)
        if let url = URL(string: "https://blockchain.info/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro)
                in
                if erro == nil {
                    if let dadosRetorno = dados {
                        do {
                            if let objetoJSON = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                                if let brl = objetoJSON["BRL"] as? [String: Any] {
                                    if let preco = brl["buy"] as? Float {
                                        let precoFormatado = self.formatarPreco(preco: NSNumber(value: preco))
                                        
                                        DispatchQueue.main.async(execute: {
                                            self.precoBitcoin.text = "R$ " + precoFormatado
                                            self.botao.setTitle("Atualizar", for: .normal)
                                        })
                                    }
                                }
                            }
                            
                        } catch {
                            print("Erro")
                        }
                    }
                } else {
                    print("Erro")
                }
                
            }
            tarefa.resume()
        }
    }


}

