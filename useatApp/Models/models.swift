//
//  Restaurant.swift
//  useatApp
//
//  Created by user196211 on 8/7/21.
//
import UIKit
    struct Restaurant {
        let id: String
        let name: String
        let description: String
        let distance: Double
        let image: UIImage
        init(data: [String: Any]) {
            self.id = data["id"] as! String
            self.name = data["name"] as! String
            self.distance = data["distance"] as! Double
            self.description = data["description"] as! String
            self.image = data["image"] as! UIImage
        }
    }

struct Association {
    let id: String
    let name: String
    let description: String
    let image: UIImage
    init(data: [String: Any]) {
        self.id = data["id"] as! String
        self.name = data["name"] as! String
        self.description = data["description"] as! String
        self.image = data["image"] as! UIImage
    }
}


