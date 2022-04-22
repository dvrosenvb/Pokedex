//
//  DetailEntity.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
public struct PokemonStat:Codable{
    var baseStat:Int?
    var effort:Int?
    var stat:ItemShared?
}

public struct ItemShared:Codable{
    var name:String?
    var url:String?
}

public struct PokemonItemType:Codable{
    var slot:Int?
    var type:ItemShared?
}

