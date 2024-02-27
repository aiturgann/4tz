//
//  CustomTableViewCell.swift
//  4tz
//
//  Created by Aiturgan Kurmanbekova on 26/2/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let view = MakerView().uiViewMaker()
    
    private let userImage = MakerView().uiImageMaker()
    
    private let commentLabel = MakerView().uiLabelMaker(text: "", 
                                                        size: 18)
    
    private let dateLabel = MakerView().uiLabelMaker(text: "", textColor: .lightGray)
    
    private let foodImage = MakerView().uiImageMaker()
    
    private let menuButton = MakerView().uiButtonMaker(title: nil,
                                                       image: UIImage(named: "ellipsis"),
                                                       tintColor: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        
        contentView.addSubview(view)
        NSLayoutConstraint.activate(
            [view.topAnchor.constraint(equalTo: contentView.topAnchor),
             view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
             view.heightAnchor.constraint(equalToConstant: 90)
            ])
        
        view.addSubview(userImage)
        view.addSubview(commentLabel)
        view.addSubview(dateLabel)
        view.addSubview(foodImage)
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate(
            [userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
             userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             userImage.heightAnchor.constraint(equalToConstant: 48),
             userImage.widthAnchor.constraint(equalToConstant: 48),
             
             commentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
             commentLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
             commentLabel.widthAnchor.constraint(equalToConstant: 200),
             
             dateLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10),
             dateLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
             dateLabel.heightAnchor.constraint(equalToConstant: 20),
             dateLabel.widthAnchor.constraint(equalToConstant: 200),
             
             foodImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
             foodImage.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 10),
             foodImage.heightAnchor.constraint(equalToConstant: 64),
             foodImage.widthAnchor.constraint(equalToConstant: 64),
             
             menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
             menuButton.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: 5),
             menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             menuButton.heightAnchor.constraint(equalToConstant: 24),
             menuButton.widthAnchor.constraint(equalToConstant: 24)
            ])
        

        
    }
    
    func setData(contacts: Contact) {
        userImage.image = contacts.userImage
        commentLabel.text = contacts.commentLabel
        dateLabel.text = contacts.dateLabel
        foodImage.image = contacts.foodImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
