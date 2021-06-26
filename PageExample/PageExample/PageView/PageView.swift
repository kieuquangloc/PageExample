//
//  PageView.swift
//  PageExample
//
//  Created by QuangLoc on 26/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class PageItem: NSObject {
    init(text: String, color: String) {
        self.text = text
        self.color = color
    }
    var text: String
    var color: String
    var time = Date().timeIntervalSince1970
}

class PageView: UIView {
    
    var arrItem = [PageItem]()
    var currentItem: PageItem?
    var currentIndex = 0 {
        didSet{
            self.showBack.onNext(self.currentIndex > 0 && self.arrItem.count > 1)
            self.showNext.onNext(self.currentIndex >= 0 && self.currentIndex < self.arrItem.count - 1 && self.arrItem.count > 1)
        }
    }
    
    var arrItemObj = PublishSubject<[PageItem]>()
    
    var showBack = PublishSubject<Bool>()
    var showNext = PublishSubject<Bool>()
    
    @IBOutlet weak var clv: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollection()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clv.reloadData()
    }
    
}

extension PageView {
    static func create() -> PageView {
        let obj = Bundle.main.loadNibNamed("PageView", owner: nil, options: nil)?.first as! PageView
        return obj
    }
}

extension PageView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollection(){
        print("\(self.className) \(#function)")
        
        PageViewCell.registerCellWith(clv: self.clv)
        
        self.clv.delegate = self
        self.clv.dataSource = self
        //        self.clv.bounces = true
        //        self.clv.alwaysBounceVertical = false
        
        self.clv.reloadData()
        self.clv.contentInsetAdjustmentBehavior = .never
        self.clv.isPagingEnabled = true
        
        //        let w = SWIDTH - 40 //* (895/1125)
        //        let h = w * 478/1015
        //        let offsetY = SHEIGHT - CGFloat(self.arrBgs.count) * h
        //        self.clv.contentInset.top = offsetY/2.0
        
        if let layout = self.clv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            self.clv.collectionViewLayout = layout
        }

        self.arrItemObj.onNext(self.arrItem)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //1015 × 478
        let w = UIScreen.main.bounds.width
        let h = collectionView.bounds.height
        return CGSize.init(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageViewCell", for: indexPath) as! PageViewCell
        cell.updateItem(item: self.arrItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(self.className) \(#function) indexPath.row: \(indexPath.row)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        if index >= 0 {
            self.currentIndex = index
        }
        
        if 0 <= index && index < self.arrItem.count {
            print("\(self.className) \(#function) index: \(index)")
            self.currentItem = self.arrItem[index]
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("\(self.className) \(#function)")
    }
    
}

extension PageView {
    
    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func addItem(){
        let text = self.randomString(length: 1)
        let color = UIColor.random()
        let item = PageItem.init(text: text, color: color.hexStringFromColor())
        
        self.clv.performBatchUpdates { [weak self] in
            guard let `self` = self else { return }
            
            if self.arrItem.count > 0{
                
                self.arrItem.insert(item, at: self.currentIndex + 1)
                self.currentItem = item
                
                let indexPath = IndexPath.init(row: self.currentIndex + 1, section: 0)
                self.clv.insertItems(at: [indexPath])
                
            }else{
                self.arrItem.append(item)
                
                let indexPath = IndexPath.init(row: 0, section: 0)
                self.clv.insertItems(at: [indexPath])
            }
            
            
        } completion: { [weak self] done in
            guard let `self` = self else { return }
            self.scrollToLatestItemDelay()
            
            self.arrItemObj.onNext(self.arrItem)
        }

        
    }
    
    func removeItem(){
        self.clv.performBatchUpdates { [weak self] in
            guard let `self` = self else { return }
            
            if self.arrItem.count > 0, self.currentIndex < self.arrItem.count {
                
                let indexPath = IndexPath.init(row: self.currentIndex, section: 0)
                self.clv.deleteItems(at: [indexPath])
                
                self.arrItem.remove(at: self.currentIndex)
                
            }else{
                if self.arrItem.count > 0 {
                    let indexPath = IndexPath.init(row: self.arrItem.count - 1, section: 0)
                    self.clv.deleteItems(at: [indexPath])
                    self.arrItem.removeLast()
                }
            }
            
        } completion: { [weak self] done in
            guard let `self` = self else { return }
            self.scrollToLatestItemDelay()
            
            self.arrItemObj.onNext(self.arrItem)
        }

    }
    
    func scrollToNextItem(){
        let nextIndex = self.currentIndex + 1
        if nextIndex < self.arrItem.count {
            self.clv.scrollToItem(at: IndexPath.init(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollToBackItem(){
        let nextIndex = self.currentIndex - 1
        if 0 <= nextIndex, nextIndex < self.arrItem.count {
            self.clv.scrollToItem(at: IndexPath.init(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc func scrollToLatestItem(){
        if let item = self.arrItem.max(by: { $0.time < $1.time }), let index = self.arrItem.firstIndex(where: {$0.time == item.time}) {
            self.clv.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc func scrollToCurrentItem(){
        if let cur = self.currentItem, let index = self.arrItem.firstIndex(where: {$0.time == cur.time}) {
            self.clv.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollToLatestItemDelay(){
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(self.scrollToLatestItem), with: nil, afterDelay: 0.2)
    }
}
