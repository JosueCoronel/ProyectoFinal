//
//  ReciboPagadoViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 12/12/22.
//

import UIKit

class ReciboPagadoViewController: UIViewController {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var codigoQRLabel: UILabel!
    
    @IBAction func cerrarTodoButton(_ sender: UIButton) {
        guard let inicioViewController = storyboard?.instantiateViewController(withIdentifier: "navigationController")  else {return}
        inicioViewController.modalPresentationStyle = .fullScreen
        present(inicioViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLabel.text = "Hola"
        let pagar = PagarViewController()
        if pagar.tipoPago == 1{ //Tarjeta
            tituloLabel.text = "Se realizó el pago con Exito! ✅"
            codigoQRLabel.text = "PG12QR56"
        }else { //Efectivo
            tituloLabel.text = "Se generó la reserva con Exito! ✅"
            codigoQRLabel.text = "RS25QR32"
        }
    }

}
