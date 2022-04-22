//
//  DetailView.swift
//  Pokedex
//
//  Created by Rosendo Vázquez on 21/04/22.
//

import Foundation
import UIKit
import SnapKit

class DetailView: UIViewController {

    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolDetail?

    //MARK: UIElements
    var viewBg: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var viewImagesContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ivSpriteFrontDefault: CustomImageView = {
        let iv = CustomImageView()
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = iv.frame.width / 2
        guard let ur = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png") else {return iv}
        iv.donwloadImage(from: ur)
        return iv
    }()
    
    lazy var ivSpriteFrontShiny: CustomImageView = {
        let iv = CustomImageView()
        iv.clipsToBounds = true
        iv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = iv.frame.width / 2
        guard let ur = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/\(id).png") else {return iv}
        iv.donwloadImage(from: ur)
        return iv
    }()
    
    lazy var viewRounded: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.borderColor = UIColor.TypeColor.Border20.cgColor
        view.layer.borderWidth = 1.2
        
        return view
    }()
    
    lazy var svContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.frame = CGRect(x: 10.0, y: 0.0, width: 400, height: 800)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.width * 0.9, height: view.frame.height)
        return scrollView
    }()
    
    lazy var lblPokemonNumber: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.layer.cornerRadius = 16
        lbl.textColor = UIColor.TypeColor.TextNumber
        lbl.text = "#\(id)"
        lbl.textAlignment = .center
        lbl.layer.backgroundColor = UIColor.TypeColor.BackgroundNumber.cgColor
        lbl.font = ThemeManager.SemiBold(22)
        return lbl
    }()
    
    lazy var lblHeader01: UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.txtName
        label.font = ThemeManager.RegularFont(18)
        label.text = "Type(s)"
        label.textAlignment = .center
        return label
    }()
    
    lazy var lblHeader02: UILabel = {
        let label = UILabel()
        label.textColor = ThemeManager.txtName
        label.font = ThemeManager.RegularFont(18)
        label.text = "Stats"
        label.textAlignment = .center
        return label
    }()
    
    lazy var separator01: UIView = {
        let line = UIView()
        line.layer.cornerRadius = 2
        line.layer.backgroundColor = ThemeManager.progressBGColor.cgColor
        return line
    }()
    
    lazy var separator02: UIView = {
        let line = UIView()
        line.layer.cornerRadius = 2
        line.layer.backgroundColor = ThemeManager.progressBGColor.cgColor
        return line
    }()
    
    //MARK: DataElements
    var id:Int
    lazy var titleView : String = "Pokedex"
    
    var typesOfPokemon:[PokemonItemType] = []
    private var typesTableView:UITableView!
    
    var statCollection: [PokemonStat] = []
    private var statTableView: UITableView!

    
    //MARK: LifeCycle
    
    init(pokemonId:Int) {
        self.id = pokemonId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupDetailNavBar()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.setupDetailNavBar()
        UINavigationBar.animate(withDuration: 0) {
            self.navigationController?.navigationBar.layoutIfNeeded()
        }
        presenter?.interactor?.fetchPokemonInformation(referencePokemon: "\(id)")
        setupTableTypes()
        setupTableStats()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        title = ""
        self.setupDetailNavBar()
        title = titleView
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.setupDetailNavBar()
    }

    
    //MARK: Functions
    
    func setupView()  {
        view.backgroundColor = .white
        view.setRandomGradient(type: .Normal, color1: ThemeManager.progressColor, color2: ThemeManager.g2)
        view.addSubview(viewImagesContainer)
        viewImagesContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(view.frame.height / 3)
            make.centerX.equalToSuperview()
        }
        
        viewImagesContainer.addSubview(ivSpriteFrontDefault)
        ivSpriteFrontDefault.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 1.2)
            make.height.equalToSuperview()
        }
        
        viewImagesContainer.addSubview(ivSpriteFrontShiny)
        ivSpriteFrontShiny.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 3.8)
            make.height.equalToSuperview()
        }
        
        view.addSubview(viewRounded)
        viewRounded.snp.makeConstraints { make in
            make.top.equalTo(viewImagesContainer.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        viewRounded.addSubview(svContainer)
        svContainer.addSubview(lblPokemonNumber)
        lblPokemonNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
        
        svContainer.addSubview(lblHeader01)
        lblHeader01.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lblPokemonNumber.snp.bottom).offset(-6)
        }
        
        svContainer.addSubview(separator01)
        separator01.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width * 0.9)
            make.height.equalTo(2)
            make.top.equalTo(lblHeader01.snp.bottom).offset(4)
        }
        
        let tapGestureRecognizerDefault = UITapGestureRecognizer(target: self, action: #selector(imageDefaultTapped(tapGestureRecognizer:)))
        ivSpriteFrontDefault.isUserInteractionEnabled = true
        ivSpriteFrontDefault.addGestureRecognizer(tapGestureRecognizerDefault)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageShinyTapped(tapGestureRecognizer:)))
        ivSpriteFrontShiny.isUserInteractionEnabled = true
        ivSpriteFrontShiny.addGestureRecognizer(tapGestureRecognizer)
    }
    func setupTableTypes(){
        typesTableView = UITableView()
        typesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        typesTableView.dataSource = self
        typesTableView.delegate = self
        typesTableView.backgroundColor = .blue
        typesTableView.separatorStyle = .none
        typesTableView.separatorColor = .clear
        typesTableView.separatorEffect = .none
        typesTableView.isScrollEnabled = false
        typesTableView.layer.backgroundColor = UIColor.clear.cgColor
        
        svContainer.addSubview(typesTableView)
        typesTableView.snp.makeConstraints { make in
            make.top.equalTo(separator01.snp.bottom).offset(20)
            make.leading.equalTo(0)
            make.width.equalTo(view.frame.width * 0.9)
            make.height.equalTo(100)
            
        }
    }
    
    func setupTableStats(){
        statTableView = UITableView()
        statTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        statTableView.dataSource = self
        statTableView.delegate = self
        statTableView.backgroundColor = .clear
        statTableView.separatorStyle = .none
        statTableView.separatorColor = .clear
        statTableView.separatorEffect = .none
        statTableView.isScrollEnabled = false
        statTableView.layer.backgroundColor = UIColor.clear.cgColor
        
        svContainer.addSubview(lblHeader02)
        lblHeader02.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(typesTableView.snp.bottom).offset(8)
        }
        
        svContainer.addSubview(separator02)
        separator02.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width * 0.9)
            make.height.equalTo(2)
            make.top.equalTo(lblHeader02.snp.bottom).offset(4)
        }
        
        
        svContainer.addSubview(statTableView)
        statTableView.snp.makeConstraints { make in
            make.top.equalTo(separator02.snp.bottom).offset(10)
            make.width.equalTo(view.frame.width * 0.9)
            make.height.equalTo(300)
        }
    }
    
    func resizeImages(imgSmall:CustomImageView, imgStandar:CustomImageView) {
        imgSmall.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 1.2)
            make.height.equalToSuperview()
        }
        
        imgStandar.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.frame.width / 3.8)
            make.height.equalToSuperview()
        }
        
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func prepareViewCell(viewParent: UITableViewCell, stat:PokemonStat) -> UIView {
        lazy var viewMain = UIView()
        viewMain.frame.size.height = 190
        viewMain.frame.size.width = viewParent.frame.width * 2
        viewMain.frame.origin.x = 20
        viewMain.layer.borderColor = UIColor.clear.cgColor
        
        lazy var lblName = UILabel()
        lblName.font = ThemeManager.RegularFont(20)
        lblName.textColor = ThemeManager.txtName
        lblName.text = (stat.stat?.name ?? "").capitalized
        
        lazy var lblBaseStat = UILabel()
        lblBaseStat.font = ThemeManager.SemiBold(16)
        lblBaseStat.textColor = ThemeManager.txtName
        lblBaseStat.textAlignment = .right
        lblBaseStat.text = "\(stat.baseStat ?? 0)"
        
        lazy var pbProgress = UIProgressView()
        pbProgress.progressViewStyle = .bar
        
        pbProgress.setProgress(Float((Double(stat.baseStat ?? 0)) / 200.0), animated: true)
        pbProgress.layer.backgroundColor = ThemeManager.progressBGColor.cgColor
        pbProgress.layer.cornerRadius = 6
        pbProgress.clipsToBounds = true
        pbProgress.layer.sublayers![1].cornerRadius = 6
        pbProgress.subviews[1].clipsToBounds = true
        pbProgress.progressTintColor  = ThemeManager.progressColor
        
        lazy var lblEffort = UILabel()
        lblEffort.font = ThemeManager.SemiBold(16)
        lblName.textColor = ThemeManager.txtName
        lblEffort.text = "\(stat.baseStat ?? 0)"//"\(stat.effort ?? 0)"
        
        viewMain.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(25)
        }
        
        viewMain.addSubview(pbProgress)
        pbProgress.snp.makeConstraints { make in
            make.width.equalTo(viewParent.frame.width * 0.9)
            make.height.equalTo(10)
            make.top.equalTo(lblName.snp.bottom).offset(2)
        }
        
        viewMain.addSubview(lblBaseStat)
        lblBaseStat.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(15)
            make.top.equalTo(lblName).offset(10)
            make.trailing.equalTo(pbProgress.snp.trailing)
        }
        
        return viewMain
    }
    
    func prepareViewCellType(viewParent: UITableViewCell, stat:PokemonItemType) -> UILabel {
        lazy var lblName = UILabel()
        lblName.font = ThemeManager.RegularFont(18)
        lblName.textAlignment = .center
        lblName.text = (stat.type?.name ?? "").capitalized
        guard let typeFetched = stat.type?.name else { return lblName }
        
        lblName.textColor = PokemonType(rawValue: typeFetched.capitalized) == .Normal ? .black : .white
        
        lblName.layer.backgroundColor = setBackground(type: PokemonType(rawValue: typeFetched.capitalized)).cgColor
        lblName.layer.cornerRadius = 13
        lblName.frame = CGRect(x: 20, y: 0, width: 100, height: 26)
        return lblName
    }
    
    func setBackground(type:PokemonType?) -> UIColor {
        switch type {
            case .Normal:
                return UIColor.TypeColor.Normal1
            case .Fire:
                return UIColor.TypeColor.Fire1
            case .Water:
                return UIColor.TypeColor.Water1
            case .Grass:
                return UIColor.TypeColor.Grass1
            case .Electric:
                return UIColor.TypeColor.Electric1
            case .Ice:
                return UIColor.TypeColor.Ice1
            case .Fighting:
                return UIColor.TypeColor.Fighting1
            case .Poison:
                return UIColor.TypeColor.Poison1
            case .Ground:
                return UIColor.TypeColor.Ground1
            case .Flying:
                return UIColor.TypeColor.Flying1
            case .Psychic:
                return UIColor.TypeColor.Psychic1
            case .Bug:
                return UIColor.TypeColor.Bug1
            case .Rock:
                return UIColor.TypeColor.Rock1
            case .Ghost:
                return UIColor.TypeColor.Ghost1
            case .Dark:
                return UIColor.TypeColor.Dark1
            case .Dragon:
                return UIColor.TypeColor.Dragon1
            case .Steel:
                return UIColor.TypeColor.Steel1
            case .Fairy:
                return UIColor.TypeColor.Fairy1
            default:
                return UIColor.TypeColor.none1
        }
    }
    
    //MARK: Actions
    
    @objc func imageDefaultTapped(tapGestureRecognizer: UITapGestureRecognizer){
        resizeImages(imgSmall: ivSpriteFrontDefault, imgStandar: ivSpriteFrontShiny)
    }
    
    @objc func imageShinyTapped(tapGestureRecognizer: UITapGestureRecognizer){
        resizeImages(imgSmall: ivSpriteFrontShiny , imgStandar: ivSpriteFrontDefault)
    }
    
}


extension DetailView:PresenterToViewProtocolDetail{
    func showPokemonData(info: PokemonByName) {
        guard let pokemonName = info.name,
        let statsCollection = info.stats,
        let typesCollection = info.types else { return }
        titleView  = pokemonName.capitalized
        title = pokemonName.capitalized
        
        
        for statValue in statsCollection{
            statCollection.append(PokemonStat(baseStat: statValue.baseStat, effort: statValue.effort, stat: ItemShared(name: statValue.stat?.name, url: statValue.stat?.url)))
        }
        
        for typeItem in typesCollection {
            typesOfPokemon.append(PokemonItemType(slot: typeItem.slot, type: ItemShared(name: typeItem.type?.name, url: typeItem.type?.url)))
        }
        
        typesTableView.reloadData()
        statTableView.reloadData()
        
    }
    
    func showErrorFetchingData(status: Bool) {
        
    }
    
    
}
 
extension DetailView: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.separatorStyle = .none

        if tableView == statTableView {
            print(statCollection[indexPath.row])
        }else{
            guard let nc = self.navigationController else { return }
            presenter?.routeToHome(type: typesOfPokemon[indexPath.row].type?.name,actualVC: nc)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == statTableView {
            return statCollection.count
        }
        return typesOfPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        if tableView == statTableView {
            cell.backgroundColor = .clear
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.selectionStyle = .none
            cell.addSubview(prepareViewCell(viewParent: cell, stat: statCollection[indexPath.row]))
            
            tableView.contentSize = CGSize(width: view.frame.width * 0.9, height: 390)
            tableView.showsVerticalScrollIndicator = false
            view.layoutIfNeeded()
            
        }else{
            cell.backgroundColor = .clear
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.selectionStyle = .none
            cell.addSubview(prepareViewCellType(viewParent: cell, stat: typesOfPokemon[indexPath.row]))
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == statTableView {
            return 48
        }
        return 30
    }
    
}
