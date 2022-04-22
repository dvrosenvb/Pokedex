//
//  DetailInteractor.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation

class DetailInteractor: PresenterToInteractorProtocolDetail {
    var presenter: InteractorToPresenterProtocolDetail?
    
    func fetchPokemonInformation(referencePokemon: String) {
        let detailNetworkRequest = NetManager(delegate: self)
        
        detailNetworkRequest.fetchDataFromServer(baseUrl: "\(Constants.URL_POKEMON_BY_NAME)\(referencePokemon.lowercased())", decode: PokemonByName.self) { statusCode, jsonResponse in
            
            guard let response = jsonResponse else {return}
            
            if statusCode == 200 {
                var model : PokemonByName = PokemonByName()
                model = response

                self.presenter?.infoPokemonFetched(info: model)
            }
            
        } failure: { statusCode, response, afError in
            self.presenter?.infoGetFailed(status: true)
        }
    }
    
    
}
 
extension DetailInteractor:NetManagerProtocol{
    func getDataFromServer(dataFetchedFromServer: PokemonHomeModelCodable) {
        
    }
    
    
}
