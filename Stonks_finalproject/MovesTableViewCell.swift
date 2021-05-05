//
//  MovesTableViewCell.swift
//  Stonks_finalproject
//
//  Created by Soha Dessouky on 5/4/20.
//  Copyright © 2020 Jeffrey Cordes. All rights reserved.
//

import UIKit

class MovesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(dpLabel)
        cellView.addSubview(typeLabel)
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        ])
        
        nameLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 40).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true

        dpLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dpLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dpLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dpLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
        typeLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        typeLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 80).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
    }
    
    let cellView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dpLabel:UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel:UILabel = {
        let label = UILabel()
        label.text = "Default"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
