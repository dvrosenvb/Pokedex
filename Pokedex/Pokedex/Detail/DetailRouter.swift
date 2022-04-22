//
//  DetailRouter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterProtocolDetail {
   
    
    static func createModule(pokemonId:Int) -> DetailView {
        
        let view = DetailView(pokemonId: pokemonId)
        let presenter :ViewToPresenterProtocolDetail & InteractorToPresenterProtocolDetail = DetailPresenter()
        let interactor : PresenterToInteractorProtocolDetail = DetailInteractor()
        let router:PresenterToRouterProtocolDetail = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view as PresenterToViewProtocolDetail
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func routeToHome(type: String?, actualVC:UINavigationController) {
        let vc = HomeRouter.createModule(type: type)
        vc.modalPresentationStyle = .fullScreen
        actualVC.pushViewController(vc, animated: true)
    }
}
