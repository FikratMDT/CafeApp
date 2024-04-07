//
//  CafeListVC.swift
//  CafeApp
//
//  Created by Fikrat on 03.04.24.
//

import UIKit

class CafeListVC: UIViewController {
    
    var cafes =  [CafeListModel]()
    var cafe: CafeListModel?
    var id = 0
    
    var cafeler = ["Mado", "Star", "Terra"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonSetup()
        collection.register(CafeListCollectionViewCell.self, forCellWithReuseIdentifier: "CafeListCollectionViewCell")
        self.collection.dataSource = self
        self.collection.delegate = self
        setupUI()
//        collection.reloadData()
    }
    
    private var collection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let  collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .gray
        return collection
    }()
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "CafeList", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                cafes = try JSONDecoder().decode([CafeListModel].self, from: data)
                collection.reloadData()
                print("success")
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func setupUI() {
//        self.view.backgroundColor = .blue
        view.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension CafeListVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeListCollectionViewCell.identifier , for: indexPath) as! CafeListCollectionViewCell  
        cell.configure(label: cafes[indexPath.row].name )
        cell.backgroundColor = .blue
        return cell
    }  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destinationVC = CafeMapVC()
        let item = cafes[indexPath.row]
        destinationVC.cafe = item
        //        controller.id = item.id
        //        show(controller, sender: nil)
        navigationController?.pushViewController(destinationVC, animated: true)
        print("1")
    }
}


