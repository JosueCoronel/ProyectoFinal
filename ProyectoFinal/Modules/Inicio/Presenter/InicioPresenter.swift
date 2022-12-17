//
//  InicioPresenter.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

protocol InicioPresenterProtocol {
    
}

class InicioPresenter {
    var view: InicioViewProtocol?
    var router: InicioRouterProtocol?
    var interactor: InicioInteractorProtocol?
}

extension InicioPresenter: InicioPresenterProtocol {
    
}

/*
extension InicioPresenter: ListaPresenterOutputProtocol {
    
    func mostrarPet(_ pet: [PetEntity]) {
//        router?.mostrar(pet)
        view?.showPets(pet)
    }

    func opcionSeleccionada(_ index: Int) {
        interactor?.favoritos()
    }
}

extension InicioPresenter: InicioPresenterInputProtocol {
    
    func showPetSelected(_ pet: PetEntity) {
        router?.presetPetDetail(pet)
    }

    func getData() {
        /// se hizo muchas cosas
        ///
        print("called: getData() presenter")
        view?.mostrar(4)
        
    }
    func presentErrorView() {
        print("called: presentErrorView presenter")
        router?.presentaAlerta()
    }
}
*/
