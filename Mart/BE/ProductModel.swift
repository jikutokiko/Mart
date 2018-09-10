//
//  ProductModel.swift
//  Mart
//
//  Created by Genie Mae Lorena Edera on 9/8/18.
//  Copyright © 2018 Genie Mae Lorena Edera. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Products {
    var productKey: Int
    var productImageUrl: String
    var productImageRandomUrl: String
    var productName: String
    var productDescription: String
    var productPrice: Float
    var productRegularPrice: Float
    
    private static var _cache:Array<Products>?
    
    static func clear()->Void {
        _cache = nil
    }
    
    static func getProducts(callback:@escaping (Array<Products>?)->Void) {
        
        APIHandler.getProductListFromApi { response in
            if let data = response.result.value {
                let jsonData = JSON(data)["products"].arrayValue
                print("+++++++++++++++++")
                _cache = Array<Products>.init()
                var cnt = 0
                for json in jsonData {
                    let currentPrice = json["pricing"]["on_sale"].intValue == 1 ? json["pricing"]["promo_price"].floatValue : json["pricing"]["price"].floatValue
                    _cache!.append(Products.init(
                        productKey: json["id"].intValue,
                        productImageUrl: "https://media.redmart.com/newmedia/200p\(json["images"][0]["name"].stringValue.replacingOccurrences(of:"\\", with: ""))",
                        productImageRandomUrl: "https://picsum.photos/200/200?image=\(cnt)",
                        productName: json["title"].stringValue,
                        productDescription: json["desc"].stringValue,
                        productPrice: currentPrice,
                        productRegularPrice: json["pricing"]["price"].floatValue
                    ))
                    print("\(cnt) : \(json["title"].stringValue)")
                    cnt = cnt + 1
                }
                callback(_cache)
            }else{
                callback(nil)
            }
        }
    }
        
    
}
