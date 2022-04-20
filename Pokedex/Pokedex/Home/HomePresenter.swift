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
    
    func logout() {
        
    }
    
    func launchHome(navigationController: UINavigationController) {
        
    }
    
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    func HomeSucceded(info: String) {
            
    }
    
    func HomeFailed(info: String) {
        
    }
    
    
}
