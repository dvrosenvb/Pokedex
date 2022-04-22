//
//  EntryPoint.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import UIKit

public class EntryPoint {
    
    public static let bundle = Bundle(for: EntryPoint.self)
    public static let shared = EntryPoint()
    
    public static func startViperModule() -> UIViewController {
        return HomeRouter.createModule(type: "")
//        return DetailRouter.createModule(pokemonId: 25)
    }
}
