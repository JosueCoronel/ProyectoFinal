//
//  InicioViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class InicioViewController: UIViewController, UITableViewDataSource {
    
    var Lista = [
        Descripcion(
            titulo: "Pastel de Chocolate",
            subTitulo: "Chocale con Mani",
            descripcion: "Muy Rico1",
            precio: 40.1,
            imagen: ""
        ),
        Descripcion(
            titulo: "Pastel de Fresa",
            subTitulo: "Fresa con Vainilla",
            descripcion: "Muy Rico2",
            precio: 40.2,
            imagen: ""
        ),
        Descripcion(
            titulo: "Pastel de Lucma",
            subTitulo: "Lucma con Pasas",
            descripcion: "Muy Rico3",
            precio: 40.3,
            imagen: ""
        )
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomTableViewCell{
            let lista = Lista[indexPath.row]
            //cell.setup(lista: lista)
            /*
            cell.tituloLabel.text = lista.titulo
            cell.subTituloLabel.text = lista.subTitulo
            cell.precioLabel.text = String(lista.precio)
             */
            return cell
            
        }else{
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
}
/*
extension InicioViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let lista = Lista[indexPath.row]
        let indice = indexPath.row
    }
}
*/
