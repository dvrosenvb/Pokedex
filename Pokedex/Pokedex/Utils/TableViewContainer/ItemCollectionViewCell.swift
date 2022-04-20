//
//  ItemCollectionViewCell.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import UIKit
import SnapKit

public struct ItemCollectionViewCellModel {
    let id:Int
    let pokemonName:String
    let image:String

}

public struct ItemCollectionViewCellModelCodable:Codable {
    let id:Int
    let pokemonName:String
    let image:String
    
}

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    func build(model:ItemCollectionViewCellModel){
        contentView.backgroundColor = ThemeManager.backgroundSearchBox
        contentView.layer.cornerRadius = ThemeManager.roundedDefault
        
        lazy var viewContainerSprite:UIView = {
            let view = UIView()
            view.clipsToBounds = true
            return view
        }()
         
        lazy var ivSprite:UIImageView = {
            let iv = UIImageView()
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFit
            iv.layer.cornerRadius = iv.frame.width / 2
            iv.image = ThemeManager.getImageFromUrl(url: model.image)
            return iv
        }()
         
        lazy var lblName : UILabel = {
            let label = UILabel()
            label.text = (model.pokemonName.capitalized)
            label.numberOfLines = 1
            label.textAlignment = .left
            label.font = ThemeManager.RegularFont(24)
            return label
        }()
        
        
      
        
        viewContainerSprite.frame.origin = CGPoint(x: 8.0, y: 10.0)
        viewContainerSprite.frame.size.height = ThemeManager.heightSprite
        viewContainerSprite.frame.size.width = ThemeManager.heightSprite
        viewContainerSprite.layer.cornerRadius = viewContainerSprite.frame.height / 2
        
        ivSprite.snp.makeConstraints { make in
            make.width.equalTo(ThemeManager.heightSprite)
            make.height.equalTo(ThemeManager.heightSprite)
        }
        
        viewContainerSprite.addSubview(ivSprite)
        contentView.addSubview(viewContainerSprite)
        contentView.addSubview(lblName)
        
        lblName.snp.makeConstraints { make in
            make.leading.equalTo(ivSprite.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(contentView.frame.width * 0.6)
            make.height.equalTo(80)
        }
        
    }
}
