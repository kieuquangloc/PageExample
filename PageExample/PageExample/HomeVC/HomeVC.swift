//
//  HomeVC.swift
//  PageExample
//
//  Created by KieuQuangLoc on 26/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    
    @IBOutlet weak var vContent: UIView!
    var pageView = PageView.create()
    
    var btnNext: UIBarButtonItem!
    var btnBack: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    
    var lblNoItem = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Home"
        
        self.initUI()
        
        self.bindingUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func initUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onBtnAdd))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.onBtnDelete))
        
        self.navigationController?.isToolbarHidden = false
        
        self.btnBack = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(self.onBtnPrevious))
        self.btnNext = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.onBtnNext))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        var items = [UIBarButtonItem]()
        items.append(self.btnBack)
        items.append(space)
        items.append(self.btnNext)
        toolbarItems = items
        
        self.btnNext.isEnabled = false
        self.btnBack.isEnabled = false
        
        
        self.vContent.addSubview(self.pageView)
        UIView.addConstraintsFourEdges(parent: self.vContent, child: self.pageView)
        
        
        self.lblNoItem.text = "No Items"
        self.lblNoItem.textAlignment = .center
        self.lblNoItem.font = .systemFont(ofSize: 50)
        self.lblNoItem.center = self.view.center
        self.lblNoItem.textColor = .black
        self.lblNoItem.isHidden = false
        self.lblNoItem.sizeToFit()
        self.lblNoItem.center = self.view.center
        self.view.insertSubview(self.lblNoItem, aboveSubview: self.pageView)
    }
    
    // MARK: - Actions
    @objc func onBtnAdd(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        self.pageView.addItem()
    }
    
    @objc func onBtnDelete(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        self.pageView.removeItem()
    }
    
    @objc func onBtnNext(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        self.pageView.scrollToNextItem()
    }
    
    @objc func onBtnPrevious(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        self.pageView.scrollToBackItem()
    }
    
}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = UIStoryboard.init(name: "HomeVC", bundle: .main).instantiateViewController(identifier: "HomeVC") as! HomeVC
        return vc
    }
}

extension HomeVC {
    func bindingUI(){
        self.pageView.arrItemObj.map({$0.count > 0}).bind { [weak self]  hasValue in
            guard let `self` = self else { return }
            self.lblNoItem.isHidden = hasValue
        }.disposed(by: disposeBag)
        
        self.pageView.showNext.bind { [weak self] value in
            guard let `self` = self else { return }
            self.btnNext.isEnabled = value
        }.disposed(by: disposeBag)
        
        self.pageView.showBack.bind { [weak self] value in
            guard let `self` = self else { return }
            self.btnBack.isEnabled = value
        }.disposed(by: disposeBag)
    }
}

