//
//  InformationViewController.swift
//  CollectionApp
//
//  Created by Maks on 05.05.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var cat = Cat(name: "", pictureName: "", description: "")
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catImageView.image = UIImage(named: cat.pictureName)
        catDescription.text = cat.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    
    
    
    
}
