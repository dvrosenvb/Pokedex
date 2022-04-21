//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation

class DetailPresenter: ViewToPresenterProtocolDetail {
    
    var view: PresenterToViewProtocolDetail?
    var interactor: PresenterToInteractorProtocolDetail?
    var router: PresenterToRouterProtocolDetail?
    
    func fetchPokemonDetail(referencePokemon: String) {
        
    }
}

extension DetailPresenter : InteractorToPresenterProtocolDetail{
    
    func infoPokemonFetched(info: PokemonHomeModel) {
        
    }
}
