//
//  ProfileViewController.swift
//  Stonks_finalproject
//
//  Created by Jeffrey Cordes on 4/27/20.
//  Copyright © 2020 Jeffrey Cordes. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, PokedexProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gameIndex: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var name = ""
    var moves:NSArray = []
    var dataSession = Pokedex()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSession.delegate = self
        var jsonResult = self.dataSession.getData(name: name)
    }
    
    @IBAction func viewMoves(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! MovesViewController
        vc.movesToDisplay = self.moves
    }
    
    //MARK: Pokedex Data Protocol
    func responseDataHandler(data:NSDictionary) {
        DispatchQueue.main.async() {
            let info = data["info"] as! NSDictionary
            let images = data["images"] as! NSDictionary
            self.moves = data["moves"] as! NSArray
            
            self.nameLabel.text = (data["name"] as! String)
            self.gameIndex.text = "Game Index: \(String(describing: info["id"] as? String))"
            //print(type(of: info["id"]!))
            self.weaknessLabel.text = "Weakness: \(info["weakness"] as! String)"
            self.typeLabel.text = "Type: \(info["type"] as! String)"
            self.descriptionLabel.text = "Description: \(info["description"] as! String)"
            //print(images["photo"]! as! String)
            
            // call load func here
            if self.imageView != nil {
                self.imageView.load(key: images["photo"]! as! String)
            }
        }
    }
    
    func responseError(message:String) {
        DispatchQueue.main.async() {
            self.descriptionLabel.text = message
        }
    }
}

extension UIImageView {
    func load(key: String) {
        let base = "https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/"
        let path = base + key
        let url = URL(string: path)!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
