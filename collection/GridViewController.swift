//
//  GridViewController.swift
//  collection
//
//  Created by MAC on 13/02/2024.
//

import UIKit

class GridViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var changeStyleBTN: UIButton!
    
    //MARK: - Variables

    var grid:Bool = false
    
    //MARK: - View Controller LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
        addBtnTapGesture()
        listBtnStyle()
    }
    
    //MARK: - Methods

    func gridBtnStyle(){
        changeStyleBTN.setImage(UIImage(systemName: "circle.grid.2x2"), for: .normal)
    }
    
    func listBtnStyle(){
        changeStyleBTN.setImage(UIImage(systemName: "list.bullet"), for: .normal)
    }
    
    func addBtnTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(change))
        changeStyleBTN.isUserInteractionEnabled = true
        changeStyleBTN.addGestureRecognizer(tap)
    }
    
    @objc func change(){
        collectionReload()
        grid.toggle()
        if grid{
            gridBtnStyle()
        }else{
            listBtnStyle()
        }
    }
    
    func collectionReload(){
        myCollectionView.reloadData()
    }
}

extension GridViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if grid {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.id, for: indexPath)
//            return cell
//
//        }else{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell2.id, for: indexPath)
//            return cell
//        }
        
        let cell = grid ? collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.id, for: indexPath): collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell2.id, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if !grid{
            let cellWidth = collectionView.bounds.width
            let cellHeight: CGFloat = 180
            return CGSize(width: cellWidth, height: cellHeight)
        }else{
            let cellWidth = collectionView.bounds.width/2 - 10
            let cellHeight: CGFloat = 180
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func setUpCollection(){
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UINib(nibName: CollectionViewCell2.id, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell2.id)
        myCollectionView.register(UINib(nibName: CollectionViewCell1.id, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell1.id)
    }
}
