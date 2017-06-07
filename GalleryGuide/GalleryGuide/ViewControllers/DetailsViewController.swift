//
//  DetailsViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    var exhibition:ExhibitionVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = exhibition.name
        aboutLabel.text = exhibition.about
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
