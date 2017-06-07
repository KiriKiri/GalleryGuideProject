//
//  DataLoader.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 5/31/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

extension Date {
    static func from(string:String?) -> Date? {
        
        guard let string = string else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss'Z'"
        return dateFormatter.date(from: string)
    }
}

protocol Parsable {
    init?(jsonDictionary: [String: Any])
}

extension ExhibitionVO: Parsable {
    
    init?(jsonDictionary: [String: Any])  {
        guard let name = jsonDictionary["name"] as? String else {
            return nil
        }
        
        self.name = name
        self.id = jsonDictionary["_id"] as? String
        self.about = jsonDictionary["about"] as? String
        self.authorName = jsonDictionary["authorName"] as? String
        self.authorDescription = jsonDictionary["authorDescription"] as? String
        self.startDate = Date.from(string: jsonDictionary["dateStart"] as? String)
        self.endDate = Date.from(string: jsonDictionary["dateEnd"] as? String)
        self.gallery = nil
    }
}

extension GalleryVO: Parsable {
    init?(jsonDictionary: [String: Any])  {
        guard let name = jsonDictionary["name"] as? String else {
            return nil
        }
        
        guard let id = jsonDictionary["_id"] as? String else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.galleryDescription = jsonDictionary["galleryDescription"] as? String
        self.email = jsonDictionary["email"] as? String
        self.facebook = jsonDictionary["facebook"] as? String
        self.city = jsonDictionary["city"] as? String
    }
}

class DataLoader {
    
    func loadJSONArray(with filename: String) -> [[String: Any]]? {
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        
        guard let rawData = try? Data(contentsOf: url) else {
            return nil
        }
        
        guard let rawArray = try? JSONSerialization.jsonObject(with: rawData) as? [[String: Any]] else {
            return nil
        }
        
        return rawArray
    }
    
    func loadExhibitions() -> [ExhibitionVO]  {
        
        var galleries:[String: GalleryVO] = [:]
        var exhibitions:[ExhibitionVO] = []
        
        load(filename: "galleries") { (item: GalleryVO, json) in
            galleries[item.id] = item
        }
            
        load(filename: "exhibitions") { (item: ExhibitionVO, json) in
            let galleryPointer = json["_p_gallery"] as? String
            let galleryId = galleryPointer?.components(separatedBy: "$").last

            var exhibition = item
            if galleryId != nil {
                exhibition.gallery = galleries[galleryId!]
            }
            
            exhibitions.append(exhibition)
        }

        return exhibitions
    }
    
    private func load<T: Parsable>(filename: String, iterationHandler:((_ item: T,_ rawJSON:[String: Any])->())) {
        if let array = loadJSONArray(with: filename) {
            for item in array {
                if let parsedItem = T(jsonDictionary: item) {
                    iterationHandler(parsedItem, item)
                }
            }
        }
    }
}
