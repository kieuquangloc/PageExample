//
//  UIVIew.swift
//  PageExample
//
//  Created by KieuQuangLoc on 26/06/2021.
//

import UIKit
extension UIView {
    
    class func addConstraintsFourEdges(parent: UIView, child: UIView, padding: CGFloat = 0.0){
        addConstraints(parent: parent, child: child, top: padding, left: padding, bottom: padding, right: padding, width: .skip, height: .skip, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsTopLeftRightHeight(parent: UIView, child: UIView, height: CGFloat){
        addConstraints(parent: parent, child: child, top: 0.0, left: 0.0, bottom: .skip, right: 0.0, width: .skip, height: height, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsBottomLeftRightHeight(parent: UIView, child: UIView, height: CGFloat){
        addConstraints(parent: parent, child: child, top: .skip, left: 0.0, bottom: 0.0, right: 0.0, width: .skip, height: height, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsTopLeftBottomWidth(parent: UIView, child: UIView, width: CGFloat){
        addConstraints(parent: parent, child: child, top: 0.0, left: 0.0, bottom: 0.0, right: .skip, width: width, height: .skip, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsTopRightBottomWidth(parent: UIView, child: UIView, width: CGFloat){
        addConstraints(parent: parent, child: child, top: 0.0, left: .skip, bottom: 0.0, right: 0.0, width: width, height: .skip, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsBottomLeftRightHeight(parent: UIView, child: UIView, bottom:CGFloat ,height: CGFloat){
        addConstraints(parent: parent, child: child, top: .skip, left: 0.0, bottom: bottom, right: 0.0, width: .skip, height: height, centerX: .skip, centerY: .skip)
    }
    
    class func addConstraintsCenterXBottom(parent: UIView, child: UIView, greaterleft:CGFloat, greaterright:CGFloat, centerX:CGFloat, bottom:CGFloat,  height: CGFloat) {
        child.translatesAutoresizingMaskIntoConstraints = false
        
        if(greaterleft != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.left,
                                                         relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.left,
                                                         multiplier: 1.0,
                                                         constant: -greaterleft))
        }
        
        if(greaterright != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.right,
                                                         relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.right,
                                                         multiplier: 1.0,
                                                         constant: -greaterright))
        }
        
        if(centerX != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                                         multiplier: 1.0,
                                                         constant: -centerX))
        }
        
        if(bottom != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                                         multiplier: 1.0,
                                                         constant: bottom))
        }
        
        if(height != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: child,
                                                         attribute: NSLayoutConstraint.Attribute.height,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: nil,
                                                         attribute: NSLayoutConstraint.Attribute.height,
                                                         multiplier: 1.0,
                                                         constant: height))
        }
        
    }
    
    class func addConstraintsCenterWidthHeight(parent: UIView, child: UIView, width: CGFloat, height: CGFloat){
        child.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                     attribute: NSLayoutConstraint.Attribute.centerX,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: child,
                                                     attribute: NSLayoutConstraint.Attribute.centerX,
                                                     multiplier: 1.0,
                                                     constant: 0))
        parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                     attribute: NSLayoutConstraint.Attribute.centerY,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: child,
                                                     attribute: NSLayoutConstraint.Attribute.centerY,
                                                     multiplier: 1.0,
                                                     constant: 0))
        parent.addConstraint(NSLayoutConstraint.init(item: child,
                                                     attribute: NSLayoutConstraint.Attribute.width,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: nil,
                                                     attribute: NSLayoutConstraint.Attribute.width,
                                                     multiplier: 1.0,
                                                     constant: width))
        parent.addConstraint(NSLayoutConstraint.init(item: child,
                                                     attribute: NSLayoutConstraint.Attribute.height,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: nil,
                                                     attribute: NSLayoutConstraint.Attribute.height,
                                                     multiplier: 1.0,
                                                     constant: height))
    }
    /**
     Enter constraintNil to set nil constraint
     */
    class func addConstraints(parent: UIView, child: UIView, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat, centerX: CGFloat, centerY: CGFloat){
        
        child.translatesAutoresizingMaskIntoConstraints = false
        
        if(top != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.top,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.top,
                                                         multiplier: 1.0,
                                                         constant: -top))
        }
        
        if(left != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.left,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.left,
                                                         multiplier: 1.0,
                                                         constant: -left))
        }
        
        if(bottom != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                                         multiplier: 1.0,
                                                         constant: bottom))
        }
        
        if(right != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.right,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.right,
                                                         multiplier: 1.0,
                                                         constant: right))
        }
        
        if(width != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: child,
                                                         attribute: NSLayoutConstraint.Attribute.width,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: nil,
                                                         attribute: NSLayoutConstraint.Attribute.width,
                                                         multiplier: 1.0,
                                                         constant: width))
        }
        
        if(height != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: child,
                                                         attribute: NSLayoutConstraint.Attribute.height,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: nil,
                                                         attribute: NSLayoutConstraint.Attribute.height,
                                                         multiplier: 1.0,
                                                         constant: height))
        }
        
        if(centerX != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                                         multiplier: 1.0,
                                                         constant: -centerX))
        }
        
        if(centerY != .skip){
            parent.addConstraint(NSLayoutConstraint.init(item: parent,
                                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                                         toItem: child,
                                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                                         multiplier: 1.0,
                                                         constant: centerY))
        }
        
    }
}

enum UIViewBorderType {
    case normal
    case correct
    case wrong
}

extension CGFloat {
    static var skip: CGFloat = 9999.0
}


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    func hexStringFromColor() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
