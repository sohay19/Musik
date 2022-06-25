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
    
    @IBOutlet weak var musicList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicList.dataSource = self
        musicList.delegate = self
    }
    
    func clickItem(inputData: MusicData) {
        let back = UIBarButtonItem(title: "   ", style: .plain, target: self, action: nil)
        back.tintColor = UIColor.gray
        self.navigationItem.backBarButtonItem = back
        
        NavigationController.shared.pushScene(naviVC: self.navigationController, scene: NavigationController.playScene(data: inputData))
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? MainHeaderView else {
                return UICollectionReusableView()
            }
            
            let randNum = Int.random(in: 0...musicManager.getCount() - 1)
            header.updateData(musicManager.getData(randNum), handler: clickItem)
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension MainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickItem(inputData: musicManager.getData(indexPath.item))
        
        musicList.deselectItem(at: indexPath, animated: true)
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing : CGFloat = 30
        
        let itemWidth : CGFloat = (collectionView.bounds.width - spacing) * 0.5
        let itemHegit : CGFloat = itemWidth + itemWidth * 0.35
        
        return CGSize(width: itemWidth, height: itemHegit)
    }
}
