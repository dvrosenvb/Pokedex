//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
import UIKit

class DetailPresenter: ViewToPresenterProtocolDetail {
     
    var view: PresenterToViewProtocolDetail?
    var interactor: PresenterToInteractorProtocolDetail?
    var router: PresenterToRouterProtocolDetail?
    
    func fetchPokemonDetail(referencePokemon: String) {
        
    }
    
    func routeToHome(type: String?, actualVC:UINavigationController) {
        router?.routeToHome(type: type, actualVC: actualVC)
    }
}

extension DetailPresenter : InteractorToPresenterProtocolDetail{
    
    func infoPokemonFetched(info: PokemonByName) {
        view?.showPokemonData(info: info)
    }
}
