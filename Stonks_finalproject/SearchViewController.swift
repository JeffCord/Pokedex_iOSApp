//
//  SearchViewController.swift
//  Stonks_finalproject
//
//  Created by Jeffrey Cordes on 4/27/20.
//  Copyright © 2020 Jeffrey Cordes. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var nameText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        nameText = nameTextField.text!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ProfileViewController
        vc.name = self.nameText
    }
}

