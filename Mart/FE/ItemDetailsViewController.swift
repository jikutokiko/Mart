//
//  ItemDetailsViewController.swift
//  Mart
//
//  Created by Genie Mae Lorena Edera on 9/8/18.
//  Copyright © 2018 Genie Mae Lorena Edera. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    var item: Products?
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productNameLabel.text = self.item?.productName
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
