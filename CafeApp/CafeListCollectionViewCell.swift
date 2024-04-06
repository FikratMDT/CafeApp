//
//  CafeListCollectionViewCell.swift
//  CafeApp
//
//  Created by Fikrat on 03.04.24.
//

import UIKit

class CafeListCollectionViewCell: UICollectionViewCell {
    
  static  let identifier = "CafeListCollectionViewCell"
    
    var cafeNameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
//    let categoryLabel: UILabel = {
//        
//        let label = UILabel()
//        label.textColor = .darkGray
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 8, weight: .medium)
//        label.numberOfLines = 0
//        return label
//    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cafeNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cafeNameLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 40)
    }
    
//    func setupUI() {
////        cafeNameLabel.backgroundColor = .clear
////        contentView.addSubview(cafeNameLabel)
//        cafeNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            
////            cafeNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
////                        // Center the label vertically
////                        cafeNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
////                        // Set width constraint (optional)
////                        cafeNameLabel.widthAnchor.constraint(equalToConstant: 200),
////                        // Set height constraint (optional)
////                        cafeNameLabel.heightAnchor.constraint(equalToConstant: 50)
//
//            cafeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//            cafeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            cafeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            cafeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
//        ])
//    }
}
