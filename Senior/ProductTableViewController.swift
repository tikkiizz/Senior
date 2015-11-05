//
//  ProductTableViewController.swift
//  Senior
//
//  Created by CPE KMUTT on 11/4/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
<<<<<<< HEAD

    //third
    //feature1

=======
>>>>>>> parent of 35da923... second
    var products = [Product]()
    var productObj = [PFObject]?()
    var imgData = NSData?()
    var productTypeToQuery : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(productTypeToQuery)
        let query = PFQuery(className: "Product")
        query.whereKey("productType", equalTo: productTypeToQuery!)
        // 2
        
        do{
            try productObj = query.findObjects()
        }catch{
            print("Error")
        }
        
        //let promotion = Promotion()
        var i=0,j=0
        for object in productObj!{
            j=i
            //print(object)
            //promotions.append(Promotion())
            let product = Product()
            products.append(product)
            products[j].setProductName((object.valueForKey("productName") as! String))
            //products[j].setProductDetail((object.valueForKey("productDetail") as! String))
            products[j].setProductType((object.valueForKey("productType") as! String))
            products[j].setProductPrice((object.valueForKey("productPrice") as! Double))
            //promotions.append(promotion)
            //print(promotionID[i])
            
            //if (promotionObj![2].valueForKey("picture") != nil) {
            let tempPic = object.valueForKey("productPicture") as! PFFile
            do {
                
                imgData = try tempPic.getData()
                if let imageData = imgData {
                    let image = UIImage(data:imageData)
                    //dispatch_async(dispatch_get_main_queue()) {
                    products[j].setProductPic(image!)
                    
                    //print(image)
                    //self.promoPic.append(image!)
                    //self.imgT.image = self.promoPic[i]
                    //j++
                    //}
                } else{
                    print("Error")
                    //return
                }
                
            } catch{
                print("Error")
            }
            
            i++
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(products.count)
        return products.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProductTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProductTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let product = products[indexPath.row]
        
        cell.lbProductName.text = product.getProductName()
        cell.imgProduct.image = product.getProductPic()
        // Configure the cell...
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        segue.destinationViewController
    }
    */
    
}
