//
//  Model.swift
//  LiWuShuo
//
//  Created by Youcai on 2017/4/18.
//  Copyright © 2017年 mm. All rights reserved.
//

import UIKit
import ObjectMapper
class Model: Mappable {
    
    var message: String?
    var data: ModelData?
    var code: Int = 0
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
        code <- map["code"]
        
        
    }
}
// MARK: - Data
class ModelData: Mappable {
    
    var categories: [Categories]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        categories <- map["categories"]
        
    }
}

// MARK: - Categories
class Categories :Mappable{
    var status: Int = 0
    var id: Int = 0
    var icon_url: String?
    var order: Int = 0
    var name: String?
    var subcategories: [Subcategories]?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        id <- map["id"]
        icon_url <- map["icon_url"]
        order <- map["order"]
        name <- map["name"]
        subcategories <- map["subcategories"]
    }
}
// MARK: - Subcategories
class Subcategories :Mappable{
    var status: Int = 0
    var id: Int = 0
    var items_count: Int = 0
    var order: Int = 0
    var icon_url: String?
    var parent_id: Int = 0
    var name: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        id <- map["id"]
        items_count <- map["items_count"]
        icon_url <- map["icon_url"]
        order <- map["order"]
        name <- map["name"]
        parent_id <- map["parent_id"]
    }
}
