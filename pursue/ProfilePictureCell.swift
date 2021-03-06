//
//  ProfilePictureCell.swift
//  pursue
//
//  Created by Jaylen Sanders on 4/5/18.
//  Copyright © 2018 Glory. All rights reserved.
//

import UIKit

protocol ProfilePictureDelegate {
    func handleProfilePicture(for cell : ProfilePictureCell)
    func setProfileImage(for cell : ProfilePictureCell)
}

class ProfilePictureCell : UICollectionViewCell {
    
    var accessSignupController : SignupController?
    var delegate : ProfilePictureDelegate?
    
    let pictureBigLabel : UILabel = {
        let label = UILabel()
        label.text = "Upload Picture."
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.init(25))
        return label
    }()
    
    let enterPicturePrompt : UILabel = {
        let label = UILabel()
        label.text = "Please upload your profile picture"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var profilePicture : UIButton = {
        let iv = UIButton()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 60
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.borderWidth = 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(changeProfilePicture), for: .touchUpInside)
        return iv
    }()
    
    lazy var addIcon : UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal)
        iv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeProfilePicture))
        tap.numberOfTapsRequired = 1
        iv.addGestureRecognizer(tap)
        return iv
    }()
    
    lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .center
        return button
    }()
    
    @objc func handleNext(){
        delegate?.handleProfilePicture(for: self)
    }
    
    @objc func changeProfilePicture(){
        accessSignupController?.handlePlusPhoto()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        addSubview(pictureBigLabel)
//        addSubview(enterPicturePrompt)
//        addSubview(profilePicture)
//        profilePicture.addSubview(addIcon)
//        addSubview(nextButton)
//        
//        pictureBigLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: pictureBigLabel.intrinsicContentSize.width, height: pictureBigLabel.intrinsicContentSize.height)
//        pictureBigLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        enterPicturePrompt.anchor(top: pictureBigLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: enterPicturePrompt.intrinsicContentSize.width, height: enterPicturePrompt.intrinsicContentSize.height)
//        enterPicturePrompt.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        
//        profilePicture.anchor(top: enterPicturePrompt.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 48, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
//        profilePicture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        addIcon.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
//        addIcon.centerXAnchor.constraint(equalTo: profilePicture.centerXAnchor).isActive = true
//        addIcon.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor).isActive = true
//        nextButton.anchor(top: topAnchor, left: nil, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 18, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 120, height: 34)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
