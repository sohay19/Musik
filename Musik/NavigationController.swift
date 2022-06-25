//
//  NavigationController.swift
//  Musik
//
//  Created by 소하 on 2022/06/24.
//

import UIKit

class NavigationController : UINavigationController {
    static let shared = NavigationController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func presentScene(naviVC: UINavigationController?, scene: UIViewController) {
        guard let navigation = naviVC else {
            self.navigationController?.present(scene, animated: true, completion: nil)
            return
        }
        navigation.present(scene, animated: true, completion: nil)
    }
    
    @objc func dismissScene(naviVC: UINavigationController?) {
        guard let navigation = naviVC else {
            self.navigationController?.dismiss(animated: true, completion: nil)
            return
        }
        navigation.dismiss(animated: true, completion: nil)
    }
    
    @objc func pushScene(naviVC: UINavigationController?, scene: UIViewController) {
        guard let navigation = naviVC else {
            self.navigationController?.pushViewController(scene, animated: true)
            return
        }
        navigation.pushViewController(scene, animated: true)
    }
    
    @objc func popScene(naviVC: UINavigationController?) {
        guard let navigation = naviVC else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        navigation.popViewController(animated: true)
    }
    
    public func makeBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}

extension NavigationController {
    static func playScene(data: Any) -> PlayViewController {
        let board = UIStoryboard(name: "Play", bundle: nil)
        let scene = board.instantiateViewController(withIdentifier: "Play") as! PlayViewController
        scene.myData = data as? MusicData
        return scene
    }
}
