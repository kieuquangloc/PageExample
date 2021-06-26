//
//  PageViewCell.swift
//  PageExample
//
//  Created by KieuQuangLoc on 26/06/2021.
//

import UIKit

class PageViewCell: UICollectionViewCell {

    @IBOutlet weak var vContent: UIView!
    var pageWeb: PageWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.pageWeb = PageWebView.create()
        self.vContent.addSubview(self.pageWeb)
        UIView.addConstraintsFourEdges(parent: self.vContent, child: self.pageWeb)
    }
    
    func updateItem(item: PageItem){
        self.pageWeb.item = item
    }

}

extension PageViewCell {
    class func registerCellWith(clv: UICollectionView) {
        clv.register(UINib(nibName: "PageViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PageViewCell")
    }
}
