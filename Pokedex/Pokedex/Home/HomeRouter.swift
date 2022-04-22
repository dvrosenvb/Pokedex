//
//  HomeRouter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterProtocolHome {
    
    
    
    
    
    weak var viewController:HomeView?
    
    static func createModule(type: String?) -> HomeView{
        let view = HomeView(type:type)
        let presenter:ViewToPresenterProtocolHome & InteractorToPresenterProtocolHome = HomePresenter()
        let interactor:PresenterToInteractorProtocolHome = HomeInteractor()
        let router:PresenterToRouterProtocolHome = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    
    func RouteToDetails(pokemonId:Int, actualVC:UINavigationController) {
        let vc = DetailRouter.createModule(pokemonId: pokemonId)
        vc.modalPresentationStyle = .fullScreen
        actualVC.pushViewController(vc, animated: true)
    }
    
    
}
