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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeListCollectionViewCell.identifier , for: indexPath) as! CafeListCollectionViewCell  
//        cell.setupUI()
        cell.cafeNameLabel.text = cafe[
        cell.backgroundColor = .blue
        return cell
    }  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
}


