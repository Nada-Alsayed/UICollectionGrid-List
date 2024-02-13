//
//  ViewController.swift
//  collection
//
//  Created by MAC on 12/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection()
    }
}

//MARK: - Extension
 
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.id, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            let cellWidth = collectionView.bounds.width/2
            let cellHeight: CGFloat = collectionView.bounds.height
            return CGSize(width: cellWidth, height: cellHeight)
        }else{
            let cellWidth = collectionView.bounds.width/4
            let cellHeight: CGFloat = collectionView.bounds.height/2
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }
    
    func setUpCollection(){
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UINib(nibName: CollectionViewCell1.id, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell1.id)
    }
}
