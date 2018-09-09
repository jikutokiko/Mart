//
//  CollectionCollectionViewController.swift
//  Mart
//
//  Created by Genie Mae Lorena Edera on 9/8/18.
//  Copyright © 2018 Genie Mae Lorena Edera. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
var cellBgColorFlag = true
fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

class CollectionCollectionViewController: UICollectionViewController {

    private var numberOfProducts: Int = 0
    var productList: Array<Products>?
    var selectedItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Products.getProducts { list in
            self.productList = list
            self.numberOfProducts = (self.productList?.count)!
            self.collectionView?.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let detailsVC = segue.destination as! ItemDetailsViewController
        let selectedCell = sender as! ItemDisplayCell
        let indexPath = collectionView?.indexPath(for: selectedCell)
        detailsVC.item = self.productList?[indexPath!.row]
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.numberOfProducts
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemDisplayCell
        
        cell.photo.load(url: URL(string: "https://media.redmart.com/newmedia/200p/i/m/9300617408710_0001_1492060322570.jpg")!)
        //cell.photo.downloaded(from: "https://www.exchangewire.com/wp-content/uploads/2016/04/Apple-Logo.png")
        //cell.photo.downloaded(from: "https://media.redmart.com/newmedia/200p/i/m/9300617408710_0001_1492060322570.jpg")
        //cell.photo.downloaded(from: "https://media.redmart.com/newmedia/200p\(self.productList![indexPath.row].productImageUrl)")
        cell.name.text = self.productList![indexPath.row].productName
        cell.price.text = "$ \(self.productList![indexPath.row].productPrice)"
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */


    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedItem = indexPath.row
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() {
//                self.image = image
//            }
//            }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}


