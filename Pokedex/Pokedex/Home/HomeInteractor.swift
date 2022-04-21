//
//  HomeInteractor.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import Alamofire


class HomeInteractor: PresenterToInteractorProtocolHome {
    
    var presenter: InteractorToPresenterProtocolHome?
    
    func fetchFirst20() {
        var model = CollectionTableViewCellModel(data: [])
        
        let homeNetworkRequest = NetManager(delegate: self)
       
        homeNetworkRequest.fetchDataFromServer(baseUrl: Constants.URL_20, decode: PokemonHomeModelCodable.self) { statusCode, jsonResponse in
            
            guard let response = jsonResponse else {return}
            
            if statusCode == 200 {
                let info = response
            
                var ix = 0
                var ixx = 1
                for i in info.results {
                    model.data.append(PokemonHomeModel(id: ix, name: i.name ?? "", url: "\(Constants.URL_IMG)\(ixx).png"))
                    ix += 1
                    ixx += 1
                }
                
                self.presenter?.searchSucceded(info: [model])
            }
            
        } failure: { statusCode, response, afError in
            print("falla el consumo")
        }
        
    }
    
    func searchByName(reference:String) {
        var model = CollectionTableViewCellModel(data: [])
        let homeNetworkRequest = NetManager(delegate: self)
       
        let range = NSRange(location: 0, length: reference.utf16.count)
        let regex = try! NSRegularExpression(pattern: "[0-9]")
        let isNumber = (regex.firstMatch(in: reference, options: [], range: range)) != nil ? true : false
        
        if isNumber {
            var index = Int(reference) ?? 0
            index = index - 1
            
            homeNetworkRequest.fetchDataFromServer(baseUrl: "\(Constants.URL_SINGLE_POKEMON)\(index)&limit=1", decode: PokemonHomeModelCodable.self) { statusCode, jsonResponse in
                
                guard let response = jsonResponse else {return}
                
                if statusCode == 200 {
                    let info = response
                
                    var ix = 0
                    var ixx = 1
                    for i in info.results {
                        model.data.append(PokemonHomeModel(id: ix, name: i.name ?? "", url: "\(Constants.URL_IMG)\(Int(reference) ?? 0 + 1).png"))
                        ix += 1
                        ixx += 1
                    }
                    
                    self.presenter?.searchSucceded(info: [model])
                }
                
            } failure: { statusCode, response, afError in
                print("falla el consumo")
            }
        }else{
            homeNetworkRequest.fetchDataFromServer(baseUrl: "\(Constants.URL_POKEMON_BY_NAME)\(reference.lowercased())", decode: PokemonByName.self) { statusCode, jsonResponse in
                
                guard let response = jsonResponse else {return}
                
                if statusCode == 200 {
                    
                    guard let photoId = response.id else { return }
                    model.data.append(PokemonHomeModel(id: response.id, name: response.name ?? "", url: "\(Constants.URL_IMG)\(photoId).png"))
                
                    
                    self.presenter?.searchSucceded(info: [model])
                }
                
            } failure: { statusCode, response, afError in
                self.presenter?.searchFailed(status: true)
            }
        }
        
    }
         
}


extension HomeInteractor:NetManagerProtocol{
    func getDataFromServer(dataFetchedFromServer: PokemonHomeModelCodable) {
        
    }
    
    
}
