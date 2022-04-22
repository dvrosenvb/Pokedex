//
//  HomeProtocols.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit

//MARK: Router - PresenterToRouter
protocol PresenterToRouterProtocolHome: AnyObject {
    static func createModule(type:String?) -> HomeView
    func RouteToDetails(pokemonId:Int, actualVC:UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolHome: AnyObject {
    var view:PresenterToViewProtocolHome? { get set }
    var interactor:PresenterToInteractorProtocolHome? { get set }
    var router:PresenterToRouterProtocolHome? {get set}
    
    func launchHome(navigationController: UINavigationController)
    func tryHome(user:String, passsword:String)
    func searchByNameOrId(reference:String)
    func searchByType(type:String)
    func goToDetails(pokemonId:Int, actualVC:UINavigationController)
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolHome: AnyObject {
    func searchSucceded(info: [CollectionTableViewCellModel])
    func searchFailed(status:Bool)
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolHome: AnyObject {
    func HomeSucceded(info: [CollectionTableViewCellModel])
    func HomeFailed(status:Bool)
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolHome:AnyObject{
    var presenter:InteractorToPresenterProtocolHome? {get set}
    func fetchFirst20()
    func searchByName(reference:String)
}

