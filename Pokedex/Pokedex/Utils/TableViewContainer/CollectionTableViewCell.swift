//
//  CollectionTableViewCell.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 19/04/22.
//

import Foundation
import UIKit

struct CollectionTableViewCellModel {
    var data:[PokemonHomeModel]
}

struct CollectionTableViewCellModelCodable:Codable {
    var data:[PokemonHomeModelCodable]
}

protocol CollectionTableViewCellDelegate:AnyObject {
    func collectionTableViewCellItemTapped(model:PokemonHomeModel)
}

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    static let identifier = "CollectionTableViewCell"
    private var dataModels : [PokemonHomeModel] = []
    
    weak var delegate:CollectionTableViewCellDelegate?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 2 )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
          for view in contentView.subviews {
              view.removeFromSuperview()
          }
      }
    
    //MARK: Layout - Add to view/layout
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
    }
    
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else{ fatalError()
        }
        cell.build(model: dataModels[indexPath.row])
        return cell
    }
    
    func build(model:CollectionTableViewCellModel){
        self.dataModels = model.data
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size:CGFloat = (contentView.frame.width * 0.94)
        return CGSize(width: size, height: ThemeManager.heightRow)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("::Tapped:: \(dataModels[indexPath.row].name!)")
        let model = dataModels[indexPath.row]
        delegate?.collectionTableViewCellItemTapped(model: model)
    }
}
