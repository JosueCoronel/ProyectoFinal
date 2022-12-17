//
//  AppBuilder.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//


import UIKit

class AppBuilder {
    static func build() -> UIViewController {
        let tabBarController = UITabBarController()
        
        let homeViewController = HomeConfigurator.make()
        
        //let homeViewController = ListaTransaccionesBuilder.build()
        //let categoriesViewController = ListaCategoriasBuilder.build()
        //let presupuestosViewController = ListaPresupuestosBuilder.build()
        
//        tabBarController.setViewControllers([
//            homeViewController,
//            //categoriesViewController,
//            //presupuestosViewController
//        ], animated: true)
        return homeViewController
    }
}
