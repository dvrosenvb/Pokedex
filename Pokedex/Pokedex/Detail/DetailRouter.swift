//
//  DetailRouter.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation

class DetailRouter: PresenterToRouterProtocolDetail {
   
    
    static func createModule() -> DetailView {
        
        let view = DetailView(nibName: nil, bundle: nil)
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
    
    func routeToHome(type: String?) {
        
    }
}
