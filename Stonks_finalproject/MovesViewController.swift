//
//  MovesViewController.swift
//  Stonks_finalproject
//
//  Created by Jeffrey Cordes on 4/27/20.
//  Copyright © 2020 Jeffrey Cordes. All rights reserved.
//

import UIKit

class MovesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var movesToDisplay:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        self.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(MovesTableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movesToDisplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MovesTableViewCell
        
        cell.backgroundColor = UIColor.white
        
        let currMove = (movesToDisplay[indexPath.row]) as! NSDictionary
        print(currMove)
        
//        // default values
//        var nameLbl:String = "n/a"
//        var typeLbl:String = "n/a"
//        var dpLbl:Int = 0
//
//        // check each dictionary item for data
//        if currMove["name"] != nil {
//            nameLbl = (currMove["name"] as! String)
//            print(nameLbl)
//        }
//
//        if currMove["dp"] != nil {
//            dpLbl = (currMove["dp"] as! Int)
//            print(dpLbl)
//        }
//
//        if currMove["type"] != nil {
//            typeLbl = (currMove["type"] as! String)
//            print(typeLbl)
//        }
//        cell.nameLabel.text = String(nameLbl)
//        cell.dpLabel.text = String(dpLbl)
//        cell.typeLabel.text = String(typeLbl)
//        print("done")
        
        if currMove["name"] == nil {
            cell.nameLabel.text = "n/a"
        } else {
            cell.nameLabel.text = (currMove["name"] as! String)
        }

        if currMove["dp"] == nil {
            cell.dpLabel.text = "n/a"
        } else {
            let dpLbl = (currMove["dp"] as! Int)
            cell.dpLabel.text = String(dpLbl)
        }
        
        if currMove["type"] == nil {
            cell.typeLabel.text = "n/a"
        } else {
            cell.typeLabel.text = (currMove["type"] as! String)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }



}
