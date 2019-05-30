//
//  ViewController.swift
//  Onde estou
//
//  Created by Felipe on 29/05/2019.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    @IBOutlet weak var velocidade: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var endereco: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario = locations.last!
        let latitude = localizacaoUsuario.coordinate.latitude
        let longitude = localizacaoUsuario.coordinate.longitude
        
        self.longitude.text = String(describing: longitude)
        self.latitude.text = String(describing: latitude)
        
        if localizacaoUsuario.speed >= 0 {
            velocidade.text = String(describing: localizacaoUsuario.speed)
        }
        
        
        let deltaLatitude:CLLocationDegrees = 0.01
        let deltaLongitude:CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualizacao:MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaVisualizacao)
        mapa.setRegion(regiao, animated: true)
        
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario, completionHandler: { (detalhesLocal, erro) in
            if erro == nil {
                if let dadosLocal = detalhesLocal?.first {
                    var thoroughfare = ""
                    if (dadosLocal.thoroughfare) != nil {
                        thoroughfare = dadosLocal.thoroughfare!
                    }
                    var subthoroughfare = ""
                    if (dadosLocal.subThoroughfare) != nil {
                        subthoroughfare = dadosLocal.subThoroughfare!
                    }
                    var country = ""
                    if (dadosLocal.country) != nil {
                        country = dadosLocal.country!
                    }
                    
                    self.endereco.text = thoroughfare + " - " + subthoroughfare + " - " + country
                    
                }
            } else {
                print(erro)
            }
        })
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status != .authorizedWhenInUse) {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

