//
//  ViewController.swift
//  MTAutoLayout
//
//  Created by Minh Thang on 11/21/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button : UIButton!
    let originSize = CGSize(width: 100, height: 80)
    let folowSize = CGSize(width: 20, height: 20)
    
    var dict : [String: NSLayoutConstraint]!
    let bgColor = UIColor.green
    let innerColor = UIColor.cyan
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton(type: UIButton.ButtonType.RoundedRect)
        button.backgroundColor = UIColor.cyanColor
        button.setTitle("change size", forState: UIControl.State.Normal)
        button.addTarget(self, action: "changeSize", forControlEvents: UIControl.Event.TouchUpInside)
        
        view.addSubview(button)
        

        // MARK: HIGH
        
        let topLeftBtn = UIButton(title: "Top Left" )
        view.addSubview(topLeftBtn)

        dict = topLeftBtn.mt_InnerAlign(PinPosition.HighLeft,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        let topCenterBtn = UIButton(title: "Top Center")
        view.addSubview(topCenterBtn)
        topCenterBtn.mt_InnerAlign(PinPosition.HighCenter, space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        let hightRightBtn = UIButton(title: "Top Right" )
        view.addSubview(hightRightBtn)
        
        hightRightBtn.mt_InnerAlign(pinTo: PinPosition.HighRight,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        
        // MARK : MID
        let midLeftBtn = UIButton(title: "Mid Left" )
        view.addSubview(midLeftBtn)
        
        midLeftBtn.mt_InnerAlign(PinPosition.MidLeft,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        
        let midCenterBtn = UIButton(title: "Mid Center")
        view.addSubview(midCenterBtn)
        midCenterBtn.mt_InnerAlign(PinPosition.Center, space: 100, size: CGSize(width: 100, height: 80), offset: UIOffset(horizontal: 0, vertical: 0))
        
        let midRightBtn = UIButton(title: "Mid Right" )
        view.addSubview(midRightBtn)
        
        midRightBtn.mt_InnerAlign(PinPosition.MidRight,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        

        
        //MARK: LOW
        let lowLeftBtn = UIButton(title: "Low Left" )
        view.addSubview(lowLeftBtn)
        
        lowLeftBtn.mt_InnerAlign(PinPosition.LowLeft,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        
        let lowCenterBtn = UIButton(title: "Low Center")
        view.addSubview(lowCenterBtn)
        lowCenterBtn.mt_InnerAlign(PinPosition.LowCenter, space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        let lowRightBtn = UIButton(title: "Low Right" )
        view.addSubview(lowRightBtn)
        
        lowRightBtn.mt_InnerAlign(PinPosition.LowRight,  space: 20, size: originSize, offset: UIOffset(horizontal: 0, vertical: 0))
        
        //MARK: - OUTER LEFT TOP
        let outerLeftBtn = UIButton(title: "L", bgColor: bgColor)
        view.addSubview(outerLeftBtn)
        outerLeftBtn.mt_OuterAlign(PinOuterPosition.Left, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerRightBtn = UIButton(title: "R", bgColor: bgColor)
        view.addSubview(outerRightBtn)
        outerRightBtn.mt_OuterAlign(PinOuterPosition.Right, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerTopBtn = UIButton(title: "T", bgColor: bgColor)
        view.addSubview(outerTopBtn)
        outerTopBtn.mt_OuterAlign(PinOuterPosition.Top, toView: midCenterBtn, space: 8, size: folowSize)

        let outerBottomBtn = UIButton(title: "B", bgColor: bgColor)
        view.addSubview(outerBottomBtn)
        outerBottomBtn.mt_OuterAlign(PinOuterPosition.Bottom, toView: midCenterBtn, space: 8, size: folowSize)

        //MARK: CONVENIENCE LEFT
        
        
        let outerBottomLeftBtn = UIButton(title: "BL", bgColor: bgColor)
        view.addSubview(outerBottomLeftBtn)
        outerBottomLeftBtn.mt_OuterAlign(PinOuterPosition.BottomLeft, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerLowerLeftBtn = UIButton(title: "LL", bgColor: bgColor)
        view.addSubview(outerLowerLeftBtn)
        outerLowerLeftBtn.mt_OuterAlign(PinOuterPosition.LowerLeft, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerHighterLeftBtn = UIButton(title: "HL", bgColor: bgColor)
        view.addSubview(outerHighterLeftBtn)
        outerHighterLeftBtn.mt_OuterAlign(PinOuterPosition.HigherLeft, toView: midCenterBtn, space: 8, size: folowSize)
        
        
        let outerTopLeftBtn = UIButton(title: "TL", bgColor: bgColor)
        view.addSubview(outerTopLeftBtn)
        outerTopLeftBtn.mt_OuterAlign(PinOuterPosition.TopLeft, toView: midCenterBtn, space: 8, size: folowSize)
        
        
        let lefterTopBtn = UIButton(title: "LT", bgColor: bgColor)
        view.addSubview(lefterTopBtn)
        lefterTopBtn.mt_OuterAlign(PinOuterPosition.LefterTop, toView: midCenterBtn, space: 8, size: folowSize)
        
        let righterTopbtn = UIButton(title: "RT", bgColor: bgColor)
        view.addSubview(righterTopbtn)
        righterTopbtn.mt_OuterAlign(PinOuterPosition.RighterTop, toView: midCenterBtn, space: 8, size: folowSize)
        
        let topRightbtn = UIButton(title: "TR", bgColor: bgColor)
        view.addSubview(topRightbtn)
        topRightbtn.mt_OuterAlign(PinOuterPosition.TopRight, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerHigherRight = UIButton(title: "HR", bgColor: bgColor)
        view.addSubview(outerHigherRight)
        outerHigherRight.mt_OuterAlign(PinOuterPosition.HigherRight, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerLowerRight = UIButton(title: "LR", bgColor: bgColor)
        view.addSubview(outerLowerRight)
        outerLowerRight.mt_OuterAlign(PinOuterPosition.LowerRight, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerBottomRight = UIButton(title: "BR", bgColor: bgColor)
        view.addSubview(outerBottomRight)
        outerBottomRight.mt_OuterAlign(PinOuterPosition.BottomRight, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerLefterBottom = UIButton(title: "LB", bgColor: bgColor)
        view.addSubview(outerLefterBottom)
        outerLefterBottom.mt_OuterAlign(PinOuterPosition.LefterBottom, toView: midCenterBtn, space: 8, size: folowSize)

        let outerRighterBottom = UIButton(title: "RB", bgColor: bgColor)
        view.addSubview(outerRighterBottom)
        outerRighterBottom.mt_OuterAlign(PinOuterPosition.RighterBottom, toView: midCenterBtn, space: 8, size: folowSize)
        
        let outerRightLine = UIView()
        outerRightLine.backgroundColor = UIColor.grayColor
        view.addSubview(outerRightLine)
        outerRightLine.mt_OuterAlign(pinTo: PinOuterPosition.Right, toView: midCenterBtn, space: 8, size: CGSize(width: 1, height: 200))
        
        let outerLine = UIView()
        outerLine.backgroundColor = UIColor.gray
        view.addSubview(outerLine)
        outerLine.mt_OuterAlign(pinTo: PinOuterPosition.Top, toView: midCenterBtn, space: 8, size: CGSize(width: 200, height: 1))
        
        let outerBottomLine = UIView()
        outerBottomLine.backgroundColor = UIColor.gray
        view.addSubview(outerBottomLine)
        outerBottomLine.mt_OuterAlign(pinTo: PinOuterPosition.Bottom, toView: midCenterBtn, space: 8, size: CGSize(width: 200, height: 1))
        
        let outerLeftLine = UIView()
        outerLeftLine.backgroundColor = UIColor.gray
        view.addSubview(outerLeftLine)
        outerLeftLine.mt_OuterAlign(pinTo: PinOuterPosition.Left, toView: midCenterBtn, space: 8, size: CGSize(width: 1, height: 200))
        let innerLefterTop = UIView()
        innerLefterTop.backgroundColor = innerColor
        midCenterBtn.addSubview(innerLefterTop)
        innerLefterTop.mt_InnerAlign(pinTo: PinPosition.HighLeft, space: 4, size: folowSize)
        let innerRighterTop = UIView()
        innerRighterTop.backgroundColor = innerColor
        midCenterBtn.addSubview(innerRighterTop)
        innerRighterTop.mt_InnerAlign(pinTo: PinPosition.HighRight, space: 4, size: folowSize)
        
        let innerTop = UIView()
        innerTop.backgroundColor = innerColor
        midCenterBtn.addSubview(innerTop)
        innerTop.mt_InnerAlign(pinTo: PinPosition.HighCenter, space: 4, size: folowSize)
        
        
        
        
        
        
        
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func changeSize() {
        self.dict[kConstraintType.innerEqualHeight]?.constant += 100
        UIView.animateWithDuration(1) { () -> Void in
            self.view.layoutIfNeeded()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

