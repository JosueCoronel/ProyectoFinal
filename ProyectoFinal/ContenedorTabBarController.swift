//
//  ContenedorTabBarController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

class ContenedorTabBarController: UITabBarController {
    
    var listaInicio = [
        Descripcion(
            codigo: "P0001",
            titulo: "Pastel de Chocolate",
            subTitulo: "Chocale con Mani",
            descripcion: "Muy Rico1",
            precio: 40.1,
            imagen: "pastel-chocolate"
        ),
        Descripcion(
            codigo: "P0002",
            titulo: "Pastel de Fresa",
            subTitulo: "Fresa con Vainilla",
            descripcion: "Muy Rico2",
            precio: 40.2,
            imagen: "pastel-fresa"
        ),
        Descripcion(
            codigo: "P0003",
            titulo: "Pastel de Lucuma",
            subTitulo: "Lucma con Pasas",
            descripcion: "Muy Rico3",
            precio: 40.3,
            imagen: "pastel-lucuma"
        ),
        Descripcion(
            codigo: "P0004",
            titulo: "Pastel de Frutos Rojos",
            subTitulo: "Con Pecanas",
            descripcion: "Muy Rico4",
            precio: 40.4,
            imagen: "pastel-frutos-rojos"
        )
    ]
    
    var listaFavorito:[Descripcion] = []
    var listaCarrito:[DescripcionCompra] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
