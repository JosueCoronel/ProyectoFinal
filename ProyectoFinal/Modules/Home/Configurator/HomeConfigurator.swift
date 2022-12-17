//
//  HomeConfigurator.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit

class HomeConfigurator {
    static func make() -> UIViewController {
        let presenter = HomePresenter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let router = HomeRouter()
        router.view = view
        
        presenter.router = router
        presenter.view = view
        
        view.presenter = presenter
        
        return view
    }
    // ahora la cosa es llamar a este configurator
    // donde deberia llamarse o en que momento 
}
