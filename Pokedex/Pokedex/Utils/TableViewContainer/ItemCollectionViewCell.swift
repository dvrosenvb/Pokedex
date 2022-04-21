//
//  ItemCollectionViewCell.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import UIKit
import SnapKit

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
    
    
    func build(model:PokemonHomeModel){
        contentView.backgroundColor = ThemeManager.backgroundSearchBox
        contentView.layer.cornerRadius = ThemeManager.roundedDefault
        
        lazy var viewContainerSprite:UIView = {
            let view = UIView()
            view.clipsToBounds = true
            return view
        }()
         
        lazy var ivSprite:CustomImageView = {
            let iv = CustomImageView()
            iv.clipsToBounds = true
            iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            iv.contentMode = .scaleAspectFit
            iv.layer.cornerRadius = iv.frame.width / 2
            guard let ur = URL(string: model.url ?? "") else {return iv}
            iv.donwloadImage(from: ur)
            return iv
        }()
         
        lazy var lblName : UILabel = {
            let label = UILabel()
            label.text = (model.name?.capitalized)
            label.numberOfLines = 1
            label.textAlignment = .left
            label.font = ThemeManager.RegularFont(24)
            return label
        }()
                
        viewContainerSprite.frame.origin = CGPoint(x: 16.0, y: 10.0)
        viewContainerSprite.frame.size.height = ThemeManager.heightSprite
        viewContainerSprite.frame.size.width = ThemeManager.heightSprite
        
        ivSprite.frame = CGRect(x: 4, y: -6, width: 80, height: 80)
        
        viewContainerSprite.addSubview(ivSprite)
        contentView.addSubview(viewContainerSprite)
        contentView.addSubview(lblName)
        
        lblName.snp.makeConstraints { make in
            make.leading.equalTo(ivSprite.snp.trailing).offset(4)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(80)
        }
        
    }
}
