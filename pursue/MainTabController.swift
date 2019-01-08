//
//  MainTabController.swift
//  pursue
//
//  Created by Jaylen Sanders on 9/11/17.
//  Copyright © 2017 Glory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MainTabController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - View Controllers
    
    let rollingTabBar : RollingPitTabBar = {
       let tb = RollingPitTabBar()
        return tb
    }()
    
    private func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            
            let photoSelectorController = SelectCameraController()
            let navController = UINavigationController(rootViewController: photoSelectorController)
            present(navController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nil, bundle: nil)
//        object_setClass(self.tabBar, RollingPitTabBar.self)
//        (self.tabBar as? RollingPitTabBar)?.setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func setupTabView(){
        view.addSubview(rollingTabBar)
        rollingTabBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
                
            }
            return
        }
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let newHomeNavController = UINavigationController(rootViewController: NewHomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        let homeNavController = UINavigationController(rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        let plusNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "create_unselected"), selectedImage: #imageLiteral(resourceName: "create_unselected"))
        let userProfileNavController = UINavigationController(rootViewController: ProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = UIColor.rgb(red: 255, green: 255, blue: 255)
        
        viewControllers = [newHomeNavController, homeNavController, plusNavController, userProfileNavController]
        
        guard let items = tabBar.items else { return }
        let tabNewHome = items[0]
        tabNewHome.image = UIImage(named: "home_unselected")?.withRenderingMode(.alwaysOriginal)
        tabNewHome.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)

        let tabHome = items[1]
        tabHome.image = UIImage(named: "home_unselected")?.withRenderingMode(.alwaysOriginal)
        tabHome.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)

        let tabCreate = items[2]
        tabCreate.image = UIImage(named: "create_unselected")?.withRenderingMode(.alwaysOriginal)
        tabCreate.selectedImage = UIImage(named: "create_unselected")?.withRenderingMode(.alwaysOriginal)

        let tabProfile = items[3]
        tabProfile.image = UIImage(named: "profile_unselected")?.withRenderingMode(.alwaysOriginal)
        tabProfile.selectedImage = UIImage(named: "profile_selected")?.withRenderingMode(.alwaysOriginal)

        for item in items {
            item.imageInsets = UIEdgeInsets.init(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController : UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
