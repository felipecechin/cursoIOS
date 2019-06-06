//
//  ViewController.swift
//  Pokemon GO
//
//  Created by Felipe on 06/06/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var contador = 0
    var coreDataPokemon: CoreDataPokemon!
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapa.delegate = self
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        self.coreDataPokemon = CoreDataPokemon()
        self.pokemons = self.coreDataPokemon.recuperarTodosPokemons()
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate {
                
                let anotacao = MKPointAnnotation()
                anotacao.coordinate = coordenadas
                let latAleatoria = (Double(arc4random_uniform(400)) - 250)/100000.0
                let longAleatoria = (Double(arc4random_uniform(400)) - 250)/100000.0
                print(latAleatoria)
                print(longAleatoria)
                anotacao.coordinate.latitude += latAleatoria
                anotacao.coordinate.longitude += longAleatoria
                
                self.mapa.addAnnotation(anotacao)
            }
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anotacaoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
    
        if annotation is MKUserLocation {
            anotacaoView.image = #imageLiteral(resourceName: "player")
        } else {
            anotacaoView.image = #imageLiteral(resourceName: "pikachu-2")
        }
        
        var frame = anotacaoView.frame
        frame.size.height = 40
        frame.size.width = 40
        
        anotacaoView.frame = frame
        
        return anotacaoView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if contador < 3 {
            self.centralizar()
            contador += 1
        } else {
            gerenciadorLocalizacao.stopUpdatingLocation()
        }
    }
    
    @IBAction func abrirPokedex(_ sender: Any) {
    }
    @IBAction func centralizarJogador(_ sender: Any) {
        self.centralizar()
    }
    func centralizar() {
        if let coordenadas = gerenciadorLocalizacao.location?.coordinate {
            let regiao = MKCoordinateRegionMakeWithDistance(coordenadas, 500, 500)
            mapa.setRegion(regiao, animated: true)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status != .authorizedWhenInUse && status != .notDetermined) {
            let alertaController = UIAlertController(title: "Permissão da localização", message: "Necessário permissão para acesso à localização", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: { (alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            present(alertaController, animated: true, completion: nil)
        }
    }


}

