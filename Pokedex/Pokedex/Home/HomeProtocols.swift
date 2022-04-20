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
    static func createModule() -> HomeView
    func pushToInfoDetail(navigationController:UINavigationController)
    func pushToHome(navigationController: UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolHome: AnyObject {
    var view:PresenterToViewProtocolHome? { get set }
    var interactor:PresenterToInteractorProtocolHome? { get set }
    var router:PresenterToRouterProtocolHome? {get set}
    
    func launchHome(navigationController: UINavigationController)
    func tryHome(user:String, passsword:String)
    func logout()
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolHome: AnyObject {
    func HomeSucceded(info:String)
    func HomeFailed(info:String)
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolHome: AnyObject {
    func HomeSucceded(info:String)
    func HomeFailed(info:String)
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolHome:AnyObject{
    var presenter:InteractorToPresenterProtocolHome? {get set}
    func sessionHome(user:String,password:String)
    func sessionLogOut()
}

