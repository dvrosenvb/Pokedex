//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterProtocolHome {
   
    
    var view:PresenterToViewProtocolHome?
    var interactor: PresenterToInteractorProtocolHome?
    var router: PresenterToRouterProtocolHome?
    
    func tryHome(user: String, passsword: String) {
        
    }
    
    func goToDetails(pokemonId:Int, actualVC:UINavigationController, name:String) {
        router?.RouteToDetails(pokemonId: pokemonId, actualVC: actualVC, name:name)
    }
    
    func searchByNameOrId(reference: String) {
        interactor?.searchByName(reference: reference)
    }
    
  
    
    
    func launchHome(navigationController: UINavigationController) {
        
    }
    
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    func searchSucceded(info: [CollectionTableViewCellModel]) {
        view?.HomeSucceded(info: info)
    }
    
    func searchFailed(status: Bool) {
        view?.HomeFailed(status: status)
    }
    
    
}
