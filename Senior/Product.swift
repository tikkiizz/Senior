//
//  Product.swift
//  Senior
//
//  Created by CPE KMUTT on 11/4/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//
import UIKit
import Foundation
class Product {
    private var productName : String
    private var productPic : UIImage?
    private var productDetail : String
    private var productType : String
    private var productPrice : Double
    
    init() {
        self.productName = ""
        //self.promoPic!.images= nil
        self.productDetail = ""
        self.productType = ""
        self.productPrice = 0.0
    }
    
    func setProductName(x: String) -> Void {
        self.productName = x
    }
    
    func setProductPic(x: UIImage) -> Void{
        self.productPic = x
    }
    func setProductDetail(x: String) -> Void{
        self.productDetail = x
    }
    func setProductType(x: String) -> Void{
        self.productType = x
    }
    func setProductPrice(x: Double) -> Void{
        self.productPrice = x
    }
    func getProductName() -> String{
        return self.productName
    }
    
    func getProductPic() -> UIImage{
        return self.productPic!
    }
    func getProductDetail() -> String{
        return self.productDetail
    }
    func getProductType() -> String{
        return self.productType
    }
    func getProductPrice() -> Double{
        return self.productPrice
    }
}