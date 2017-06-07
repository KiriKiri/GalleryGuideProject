//
//  ExhibitionsModel.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

class ExhibitionsModel {
    
    static var instance: ExhibitionsModel = ExhibitionsModel()
    
    private(set) var exhibitions:[ExhibitionVO] = []
    
    func loadExhibitions() {
        exhibitions = DataLoader().loadExhibitions()
    }
}
