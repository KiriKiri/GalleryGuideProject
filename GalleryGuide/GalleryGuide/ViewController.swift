//
//  ViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/24/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataLoader = DataLoader()
        let result = dataLoader.loadExhibitions()
        
        print("Result: \(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

