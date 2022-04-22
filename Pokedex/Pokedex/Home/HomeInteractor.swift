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
            
                var ix = 1
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
        }else if isType(base: reference){
            let type = getValueType(value: reference)
            
            homeNetworkRequest.fetchDataFromServer(baseUrl: "\(Constants.URL_POKEMON_BY_TYPE)\(type)", decode: PokemonTypeModel.self) { statusCode, jsonResponse in
                
                guard let response = jsonResponse else {return}
                
                if statusCode == 200 {
                    
                    guard let pokemons = response.pokemon else { return }
                    var pokeName = ""
                    var pokeImage = ""
                    for pokemon in pokemons {
                        pokeName = pokemon.pokemon?.name ?? ""
                        pokeImage = pokemon.pokemon?.url ?? ""
                        let pokeId = Int(self.getPokemonIdFromUrl(url:pokeImage))
                        model.data.append(PokemonHomeModel(id: pokeId, name: pokeName , url: "\(Constants.URL_IMG)\(pokeId ?? 2000).png"))
                    }
                    self.presenter?.searchSucceded(info: [model])
                }
                
            } failure: { statusCode, response, afError in
                self.presenter?.searchFailed(status: true)
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
    
   
    var typesAvaliable = ["acero", "agua", "bicho", "dragón", "eléctrico", "fantasma", "fuego", "hada", "hielo", "lucha", "normal", "planta", "psíquico", "roca", "siniestro", "tierra", "veneno", "volador", "normal", "fire", "water", "grass", "electric", "ice", "fighting", "poison", "ground", "flying", "psychic", "bug", "rock", "ghost", "dark", "dragon", "steel", "fairy"]

    func isType(base:String) -> Bool {
        for i in typesAvaliable{
            if base == i {
                return true
            }
        }
        return false
    }


    func getValueType(value:String) -> String{
        switch value {
        case "acero", "steel" :
            return "steel"
        case "agua", "water" :
            return "water"
        case "bicho", "bug" :
            return "bug"
        case "dragón", "dragon" :
            return "dragon"
        case "eléctrico", "electric" :
            return "electric"
        case "fantasma", "ghost" :
            return "ghost"
        case "fuego", "fire" :
            return "fire"
        case "hada", "fairy" :
            return "fairy"
        case "hielo", "ice" :
            return "ice"
        case "lucha", "fighting" :
            return "fighting"
        case "normal" :
            return "normal"
        case "planta", "grass" :
            return "grass"
        case "psíquico", "psychic" :
            return "psychic"
        case "roca", "rock" :
            return "rock"
        case "siniestro", "dark" :
            return "dark"
        case "tierra", "ground" :
            return "ground"
        case "veneno", "poison" :
            return "poison"
        case "volador", "flying" :
            return "flying"
        default:
            return ""
        }
    }
    
    func getPokemonIdFromUrl(url:String) -> String{
        return  url.components(separatedBy: "/")[6]
    }
 
}


extension HomeInteractor:NetManagerProtocol{
    func getDataFromServer(dataFetchedFromServer: PokemonHomeModelCodable) {
        
    }
    
    
}
