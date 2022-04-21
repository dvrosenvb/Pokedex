//
//  DetailProtocols.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation

//MARK: Presenter -> Router
protocol PresenterToRouterProtocolDetail: AnyObject {
    static func createModule() -> DetailView
    func routeToHome(type:String?)
}

//MARK: View -> Presenter
protocol ViewToPresenterProtocolDetail: AnyObject {
    var view:PresenterToViewProtocolDetail? { get set }
    var interactor:PresenterToInteractorProtocolDetail? { get set }
    var router:PresenterToRouterProtocolDetail? {get set}
    
    func fetchPokemonDetail(referencePokemon:String)
    
}

//MARK: Presenter -> Interactor
protocol PresenterToInteractorProtocolDetail:AnyObject{
    var presenter:InteractorToPresenterProtocolDetail? {get set}
    func fetchPokemonInformation(referencePokemon:String)
}


//MARK: Interactor -> Presenter
protocol InteractorToPresenterProtocolDetail: AnyObject {
    func infoPokemonFetched(info:PokemonHomeModel)
}


//MARK: Presenter -> View
protocol PresenterToViewProtocolDetail: AnyObject {
    func showPokemonData(info:PokemonHomeModel)
    func showErrorFetchingData(status:Bool)
}


