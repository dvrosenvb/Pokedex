//
//  NetManager.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 20/04/22.
//

import Foundation
import Alamofire

protocol NetManagerProtocol{
    func getDataFromServer(dataFetchedFromServer:PokemonHomeModelCodable)
}

class NetManager {
    let delegate:NetManagerProtocol
    var infoFetched = [PokemonHomeModelCodable]()
    
    init(delegate: NetManagerProtocol) {
        self.delegate = delegate
    }
    
    func fetchDataFromServer<T: Codable>(baseUrl:String,
                                         decode: T.Type,
                                         success: @escaping (_ statusCode: Int, _ response: T?) -> Void,
                                         failure: @escaping (_ statusCode: Int, _ response: T?, _ afError: AFError?) -> Void)
    {
        print(":::::baseUrl -> \(baseUrl)")
        
        func parseResponseData(_ data: Data?) -> T? {
            guard let data = data else { return nil }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try? decoder.decode(T.self, from: data)
        }
        
        
        AF.request(baseUrl, encoding: JSONEncoding.default){ $0.timeoutInterval = 60 }
        .validate(statusCode: 200..<300)
        .responseDecodable { (response: DataResponse<T, AFError>) in
            
            let statusCode = response.response?.statusCode ?? -666
            
            switch response.result {
            case .success(_):
                
                if let value = parseResponseData(response.data) {
                    success(statusCode, value)
                } else {
                    failure(statusCode, nil, response.error)
                }
                
            case .failure(let error):
                let value = parseResponseData(response.data)
                switch statusCode {
                case 200:
                    success(statusCode, value)
                    
                    
                default:
                    
                    failure(statusCode, value, error)
                }
            }
        }
    }
}
