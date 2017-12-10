//
//  NewMessageController.swift
//  pursue
//
//  Created by Jaylen Sanders on 9/17/17.
//  Copyright © 2017 Glory. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {
    let cellId = "cellId"
    
    var users = [User]()
    var messagesController: MessagesController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationController?.navigationBar.isHidden = true
        tableView.contentInset = UIEdgeInsetsMake(55, 0, 0, 0)
        
        fetchUser()
        setupNavBarWithUser()
    }
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setTitle("CANCEL", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    func setupNavBarWithUser() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(backButton)
        backButton.anchor(top: guide.topAnchor, left: guide.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: backButton.intrinsicContentSize.width, height: backButton.intrinsicContentSize.height)
     
    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if var dictionary = snapshot.value as? [String: AnyObject] {
                
                let user = User(uid: snapshot.key,dictionary: dictionary)
                
                guard let userId = Auth.auth().currentUser?.uid else { return }
                
                if user.uid == userId {
                    
                    dictionary.removeValue(forKey: snapshot.key)
                
                } else {
                    
                    self.users.append(user)
                }
                

                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
            
        }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Setup Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.fullname
        cell.profileImageView.loadImageUsingCacheWithUrlString(user.profileImageURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let user = self.users[indexPath.row]
            let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
            chatLogController.user = user
            self.navigationController?.pushViewController(chatLogController, animated: true)
    }

}
