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
    
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var productCurrentPrice: UILabel!
    @IBOutlet weak var productRegularPrice: UILabel!
    @IBOutlet weak var productSavings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productNameLabel.text = self.item?.productName
        self.productDescLabel.text = self.item?.productDescription
        self.productCurrentPrice.text = "$\(String(describing: (self.item?.productPrice)!))"
        self.productRegularPrice.attributedText = "$\(String(describing: (self.item?.productRegularPrice)!))".strikeThrough()
        self.productSavings.text = "SAVE \((self.item?.productRegularPrice)! - (self.item?.productPrice)!)"
        
        self.productCurrentPrice.sizeToFit()
        self.productRegularPrice.sizeToFit()
        self.productDescLabel.sizeToFit()

        
        /**Having issues with media.redmart.com, so temporarily used random image*/
        self.productImageView.load(url: URL(string: (self.item?.productImageRandomUrl)!)!)
        //uncomment to load actual images from API
        //self.productImageView.load(url: URL(string: (self.item?.productImageUrl)!)!)
        
        if(self.item?.productRegularPrice == self.item?.productPrice){
            self.productRegularPrice.isHidden = true
            self.productSavings.isHidden = true
        }
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

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
