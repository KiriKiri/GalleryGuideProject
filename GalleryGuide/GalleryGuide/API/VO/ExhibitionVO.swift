//
//  ExhibitionVO.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

struct ExhibitionVO {
    var id:String?
    var name:String
    var about:String?
    var authorName:String?
    var authorDescription:String?
    var startDate:Date?
    var endDate:Date?
    var gallery:GalleryVO?
}
