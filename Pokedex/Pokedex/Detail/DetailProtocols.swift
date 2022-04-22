//
//  DetailProtocols.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
import UIKit
//MARK: Presenter -> Router
protocol PresenterToRouterProtocolDetail: AnyObject {
    static func createModule(pokemonId:Int) -> DetailView
    func routeToHome(type:String?, actualVC:UINavigationController)
}

//MARK: View -> Presenter
protocol ViewToPresenterProtocolDetail: AnyObject {
    var view:PresenterToViewProtocolDetail? { get set }
    var interactor:PresenterToInteractorProtocolDetail? { get set }
    var router:PresenterToRouterProtocolDetail? {get set}
    
    func fetchPokemonDetail(referencePokemon:String)
    func routeToHome(type:String?, actualVC:UINavigationController)
}

//MARK: Presenter -> Interactor
protocol PresenterToInteractorProtocolDetail:AnyObject{
    var presenter:InteractorToPresenterProtocolDetail? {get set}
    func fetchPokemonInformation(referencePokemon:String)
}


//MARK: Interactor -> Presenter
protocol InteractorToPresenterProtocolDetail: AnyObject {
    func infoPokemonFetched(info:PokemonByName)
}


//MARK: Presenter -> View
protocol PresenterToViewProtocolDetail: AnyObject {
    func showPokemonData(info:PokemonByName)
    func showErrorFetchingData(status:Bool)
}


