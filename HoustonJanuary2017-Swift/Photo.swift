//
//  Photo.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/6/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class Photo {
    
    var id :Int
    var title :String
    var thumbnailURL :String
    
    init(id :Int, title: String, thumbnailURL :String) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
    }
    
}
