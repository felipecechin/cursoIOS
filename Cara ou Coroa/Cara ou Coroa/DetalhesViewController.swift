//
//  DetalhesViewController.swift
//  Cara ou Coroa
//
//  Created by Felipe on 23/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import UIKit

class DetalhesViewController: UIViewController {
    var numeroRandomicoRecebido: Int!
    
    @IBOutlet weak var moedaImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numeroRandomicoRecebido == 0{
            moedaImage.image = #imageLiteral(resourceName: "moeda_cara")
        } else {
            moedaImage.image = #imageLiteral(resourceName: "moeda_coroa")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

