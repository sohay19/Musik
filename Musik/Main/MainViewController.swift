//
//  ViewController.swift
//  Musik
//
//  Created by 소하 on 2022/06/16.
//

import UIKit

//MARK: - MainView
class MainViewController: UIViewController {
    let musicManager = MusicManager()
    
    @IBOutlet weak var MainList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //직접 연결하거나 코드로 할당
        MainList.dataSource = self
        MainList.delegate = self
    }
}

extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicManager.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainViewCell else {
            return UICollectionViewCell()
        }
        cell.updateData(musicManager.getData(indexPath.item))
        return cell
    }
}

extension MainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var spacing : CGFloat = 0
        
        if let myLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            spacing = myLayout.sectionInset.left + myLayout.sectionInset.right
            + myLayout.minimumInteritemSpacing
        }
        
        let itemWidth : CGFloat = (collectionView.bounds.width - spacing) * 0.5
        let itemHegit : CGFloat = itemWidth + itemWidth * 0.4
        
        return CGSize(width: itemWidth, height: itemHegit)
    }
}
