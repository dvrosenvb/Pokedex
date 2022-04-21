//
//  ThemeManager.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import SwiftUI

public struct ThemeManager{
    
    public static let borderColor = #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2156862745, alpha: 1) // 343437
    public static let searchIcon80 = #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2156862745, alpha: 0.8) // 343437
    public static let backgroundGenericView = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1) // FDFDFD
    public static let backgroundSearchBox = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1) //EEF0F2
    public static let backgroundIcoPokeball = #colorLiteral(red: 0.8745098039, green: 0.8862745098, blue: 0.8941176471, alpha: 0.2762313742) //DFE2E4
    
    public static let roundedDefault = 20.0
    public static let heightStandardTextField = 48
    public static let sideSquared = 30
    public static let heightRow = 102.0
    public static let heightSprite = 80.0
    public static let iconSearch = "magnifyingglass"
    
    public static func CustomFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "UpheavalTT-BRK-", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func RegularFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    
    public static func getImageFromUrl(url:String) -> UIImage {
        lazy var blankImg = UIImage(systemName: "camera.viewfinder") ?? UIImage()
        guard let imageUrl = URL(string: url),
              let imageData = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: imageData) else { return blankImg }
        return image
    }
}

public enum PokemonType{
    case Normal
    case Fire
    case Water
    case Grass
    case Electric
    case Ice
    case Fighting
    case Poison
    case Ground
    case Flying
    case Psychic
    case Bug
    case Rock
    case Ghost
    case Dark
    case Dragon
    case Steel
    case Fairy
    case none
}


