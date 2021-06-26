//
//  HomeVC.swift
//  PageExample
//
//  Created by QuangLoc on 26/06/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var vContent: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Home"
        
        self.initUI()
        
        let obj = PageWebView.create()
        self.vContent.addSubview(obj)
        UIView.addConstraintsFourEdges(parent: self.vContent, child: obj)
    }

    func initUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onBtnAdd))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.onBtnDelete))
        
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(self.onBtnPrevious))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.onBtnNext))
        )
        toolbarItems = items
    }
    
    // MARK: - Actions
    @objc func onBtnAdd(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
    }
    
    @objc func onBtnDelete(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
    }
    
    @objc func onBtnNext(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
    }
    
    @objc func onBtnPrevious(){
        print("\(self.className) \(#function)")
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
    }
    
}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = UIStoryboard.init(name: "HomeVC", bundle: .main).instantiateViewController(identifier: "HomeVC") as! HomeVC
        return vc
    }
}

extension HomeVC {
    
}

