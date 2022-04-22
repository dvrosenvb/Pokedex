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
    public static let txtName = #colorLiteral(red: 0.3215686275, green: 0.3176470588, blue: 0.3176470588, alpha: 1) // 525151
    public static let searchIcon80 = #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2156862745, alpha: 0.8) // 343437
    public static let backgroundGenericView = #colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1) // FDFDFD
    public static let backgroundSearchBox = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1) //EEF0F2
    public static let backgroundIcoPokeball = #colorLiteral(red: 0.8745098039, green: 0.8862745098, blue: 0.8941176471, alpha: 0.2762313742) //DFE2E4
    public static let progressColor = #colorLiteral(red: 0.9764705882, green: 0.6156862745, blue: 0.537254902, alpha: 1) //F99D89
    public static let progressBGColor = #colorLiteral(red: 0.9029947917, green: 0.9029947917, blue: 0.9029947917, alpha: 1) //F99D89
    public static let g2 = #colorLiteral(red: 0.9764705882, green: 0.8099190611, blue: 0.8311942211, alpha: 1) //F99D89
    
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
        return UIFont(name: "RedHatDisplay-SemiBold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func SemiBold(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .semibold)
    }
    
    
    public static func getImageFromUrl(url:String) -> UIImage {
        lazy var blankImg = UIImage(systemName: "camera.viewfinder") ?? UIImage()
        guard let imageUrl = URL(string: url),
              let imageData = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: imageData) else { return blankImg }
        return image
    }
}

public enum PokemonType:String{
    case Normal   = "Normal"
    case Fire     = "Fire"
    case Water    = "Water"
    case Grass    = "Grass"
    case Electric = "Electric"
    case Ice      = "Ice"
    case Fighting = "Fighting"
    case Poison   = "Poison"
    case Ground   = "Ground"
    case Flying   = "Flying"
    case Psychic  = "Psychic"
    case Bug      = "Bug"
    case Rock     = "Rock"
    case Ghost    = "Ghost"
    case Dark     = "Dark"
    case Dragon   = "Dragon"
    case Steel    = "Steel"
    case Fairy    = "Fairy"
}


