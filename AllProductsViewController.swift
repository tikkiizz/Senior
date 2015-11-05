//
//  AllProductsViewController.swift
//  Senior
//
//  Created by CPE KMUTT on 11/3/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class AllProductsViewController: UIViewController {
    var productTypes = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let arrayOfVillains = ["santa", "bugs", "superman", "batman"]
        
        
        let query = PFQuery(className: "Product")
        var parseProductObj = [PFObject]?()
        //query.whereKey("promotionID", equalTo: "promo1")
        // 2
        
        do{
            try parseProductObj = query.findObjects()
        }catch{
            print("Error")
        }
        for object in parseProductObj!{
            //print(object)
            let tempPruductType = object["productType"] as! String
            if productTypes.count==0{
                productTypes.append(tempPruductType)
            }
            else{
                var dupType = false
                for var i=0; i < productTypes.count && dupType == false; ++i{
                    if (tempPruductType == productTypes[i]){
                        dupType = true
                    }
                }
                if(dupType == false){
                    productTypes.append(tempPruductType)
                }
            }
            //strContact = strContact + "Branch \(object["productType"] as! String) \n"
            
        }
        
        var buttonY: CGFloat = 100  // our Starting Offset, could be 0
        for productType in productTypes {
            
            
            let productTypeButton = UIButton(frame: CGRect(x: 50, y: buttonY, width: 100, height: 30))
            buttonY = buttonY + 50  // we are going to space these UIButtons 50px apart
            
            productTypeButton.layer.cornerRadius = 10  // get some fancy pantsy rounding
            productTypeButton.backgroundColor = UIColor.darkGrayColor()
            productTypeButton.setTitle(productType, forState: UIControlState.Normal) // We are going to use the item name as the Button Title here.
            productTypeButton.titleLabel?.text = productType
            productTypeButton.addTarget(self, action: "productTypeButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            self.view.addSubview(productTypeButton)  // myView in this case is the view you want these buttons added
        }
        // Do any additional setup after loading the view.
    }
    func productTypeButtonPressed(sender:UIButton!) {
        
        if sender.titleLabel?.text != nil {
            //print("You have chosen Villain: \(sender.titleLabel?.text)")
            self.performSegueWithIdentifier("ProductTableViewController", sender: self)
            let productTableViewController = ProductTableViewController(nibName: "ProductTableViewController", bundle: nil)
            //print(sender.titleLabel?.text)
            
            productTableViewController.productTypeToQuery = (sender.titleLabel?.text)!
            //print(productTableViewController.productTypeToQuery)
            navigationController?.pushViewController(productTableViewController, animated: true)


        } else {
            
            print("Nowhere to go :/")
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        segue.destinationViewController
    }
    

}
