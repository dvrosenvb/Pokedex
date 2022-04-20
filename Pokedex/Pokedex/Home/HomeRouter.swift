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
    
    static func createModule() -> HomeView{
        let view = HomeView(nibName: nil, bundle: nil)
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
    
    func pushToInfoDetail(navigationController: UINavigationController) {
        let canva = HomeRouter.createModule()
        navigationController.pushViewController(canva, animated: true)
    }
    
    func pushToHome(navigationController: UINavigationController) {
        let vc = HomeRouter.createModule()
        navigationController.pushViewController(vc, animated: true)
    }
}