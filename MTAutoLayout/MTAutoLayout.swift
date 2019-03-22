//
//  MTAutoLayout.swift
//  MTAutoLayout
//
//  Created by Minh Thang on 11/21/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit


enum PinPosition : Int {
    case HighLeft, HighCenter, HighRight
    case MidLeft, Center, MidRight
    case LowLeft, LowCenter, LowRight
    
}

enum BasicConstraintType: Int {
    case TopToTop, LeadToLead, TrailToTrail, BottomToBottom
    case TopToBottom, BottomToTop, LeadToTrail,TrailToLead
    case CenterXToCenterX, CenterYToCenterY
}




enum PinOuterPosition {
    case BottomLeft, LowerLeft, Left, HigherLeft, TopLeft, LefterTop, Top, RighterTop
    case TopRight,HigherRight, Right, LowerRight, BottomRight, RighterBottom, Bottom, LefterBottom
}

extension kConstraintType {
    
    static let outerTrailToLead = "outerTrailToLead"
    static let innerTrailToLead = "innerTrailToLead"
    static let outerLeadToTrail = "outerLeadToTrail"
    static let innerLeadToTrail = "innerLeadToTrail"
    static let outerBottomToTop = "outerBottomToTop"
    static let innerBottomToTop = "innerBottomToTop"
    static let outerTopToBottom = "outerTopToBottom"
    static let innerTopToBottom = "innerTopToBottom"
    
}

class kConstraintType {
    static let innerEqualWidth = "innerEqualWidth"
    static let innerEqualHeight = "innerEqualHeight"
    static let innerTopToTop = "innerTopToTop"
    static let innerTrailToTrail = "innerTrailToTrail"
    static let innerBottomToBottom = "innerBottomToBottom"
    static let innerLeadToLead = "innerLeadToLead"
    static let innerCenterXToCenterX = "innerCenterXToCenterX"
    static let innerCenterYToCenterY = "innerCenterYToCenterY"
    
    static let outerEqualWidth = "outerEqualWidth"
    static let outerEqualHeight = "outerEqualHeight"
    static let outerTopToTop = "outerTopToTop"
    static let outerTrailToTrail = "outerTrailToTrail"
    static let outerBottomToBottom = "outerBottomToBottom"
    static let outerLeadToLead = "outerLeadToLead"
    static let outerCenterXToCenterX = "outerCenterXToCenterX"
    static let outerCenterYToCenterY = "outerCenterYToCenterY"
}

extension UIView {
    
    //MARK: - AlignInner
    func mt_BasicConstraint(constriantType: BasicConstraintType ,toView v: UIView?, space: CGFloat, priority: Float = 1000) {
        switch constriantType {
        case .LeadToLead:
            leadToLead(toView: v, space: space, priority: priority)
        case .TrailToTrail:
            trailToTrail(toView: v, space: space, priority: priority)
        case .TopToTop:
            topToTop(toView: v, space: space, priority: priority)
        case .BottomToBottom:
            bottomToBottom(toView: v, space: space, priority: priority)
        case .LeadToTrail:
            leadToTrail(toView: v, space: space, priority: priority)
        case .TrailToLead:
            trailToLead(toView: v, space: space, priority: priority)
        case .BottomToTop:
            bottomToTop(toView: v, space: space, priority: priority)
        case .TopToBottom:
            topToBottom(toView: v, space: space, priority: priority)
        case .CenterXToCenterX:
            centerXToCenterX(toView: v, space: space, priority: priority)
        case .CenterYToCenterY:
            centerYToCenterY(toView: v, space: space, priority: priority)
        }
    }

    
    func mt_InnerAlign (pinTo: PinPosition, space: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        switch pinTo {
        case PinPosition.HighLeft:
            return hightLeft(topLeft: space, size: size, offset: offset)
        case PinPosition.HighCenter:
            return hightCenter(top: space, size: size, offset: offset)
        case PinPosition.HighRight:
            return hightRight(topRight: space, size: size, offset: offset)
        case PinPosition.MidLeft:
            return midLeft(left: space, size: size, offset: offset)

        case PinPosition.Center:
            return center(size, offset: offset)
            
        case PinPosition.MidRight:
            return midRight(right: space, size: size, offset: offset)
        case PinPosition.LowLeft:
            return lowLeft(bottomLeft: space, size: size, offset: offset)
        case PinPosition.LowCenter:
            return lowCenter(bottom: space, size: size, offset: offset)
            
        case PinPosition.LowRight:
            return lowRight(bottomRight: space, size: size, offset: offset)
            
        }
    }
    
    
    
    // MARK: HIGH
    
    private func hightLeft (topLeft x: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let top = topToTop(space: x + offset.vertical)
        let lead = leadToLead(space: x + offset.horizontal)
        dict[lead.identifier!] = lead
        dict[top.identifier!] = top
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func hightCenter(top top: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let gap = topToTop(space: top + offset.vertical)
        let centerX = centerXToCenterX(space: offset.horizontal)
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }

        dict[gap.identifier!] = gap
        dict[centerX.identifier!] = centerX
        
        return dict
    }
    
    private func hightRight(topRight topRight: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let top = topToTop(space: topRight + offset.vertical)
        let trail = trailToTrail(space: -topRight + offset.horizontal)
        dict[top.identifier!] = top
        dict[trail.identifier!] = trail
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }

    //MARK: MID
    
    private func midLeft (left: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let centerY = centerYToCenterY(space: offset.vertical)
        let left = leadToLead(space: left + offset.horizontal)
        
        dict[left.identifier!] = left
        dict[centerY.identifier!] = centerY
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }

    private func center(size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint] {
        var dict = [String: NSLayoutConstraint]()
        
        let centerX = centerXToCenterX(space: offset.horizontal)
        let centerY = centerYToCenterY(space: offset.vertical)
        dict[centerX.identifier!] = centerX
        dict[centerY.identifier!] = centerY
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func midRight (right: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let centerY = centerYToCenterY(space: offset.vertical)
        let rightConstraint = trailToTrail(space: -right + offset.horizontal)
        
        dict[rightConstraint.identifier!] = rightConstraint
        dict[centerY.identifier!] = centerY
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    
    // MARK: LOW
    private func lowLeft (bottomLeft: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let bottom = bottomToBottom(space: -bottomLeft + offset.vertical)
        let left = leadToLead(space: bottomLeft + offset.horizontal)
        
        dict[bottom.identifier!] = bottom
        dict[left.identifier!] = left
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lowCenter(bottom: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint] {
        var dict = [String: NSLayoutConstraint]()
        
        let centerX = centerXToCenterX(space: offset.horizontal)
        let bottom = bottomToBottom(space: -bottom + offset.vertical)
        dict[centerX.identifier!] = centerX
        dict[bottom.identifier!] = bottom
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lowRight (bottomRight: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let bottom = bottomToBottom(space: -bottomRight + offset.vertical)
        let rightConstraint = trailToTrail(space: -bottomRight + offset.horizontal)
        
        dict[rightConstraint.identifier!] = rightConstraint
        dict[bottom.identifier!] = bottom
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (size: _size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    // MARK: SIZE
    
    
    func mt_SetSize (size: CGSize) -> [String: NSLayoutConstraint] {
        let constraintHeight = equalHeight(height: size.height)
        let constraintWidth = equalWidth(width: size.width)
        return [kConstraintType.innerEqualWidth: constraintWidth, kConstraintType.innerEqualHeight: constraintHeight]

    }
    
    func mt_SetSizeFromView(toView v: UIView) -> [String: NSLayoutConstraint]
    {

            let constraintHeight = equalHeightTo(view: v)
            let constraintWidth = equalWidthTo(view: v)
            return [kConstraintType.outerEqualWidth: constraintWidth, kConstraintType.outerEqualHeight: constraintHeight]

    }
    
    
    //MARK: Basic AlignInner
    
    func mt_innerAlign(left left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        if let theLeft = left {
            let constraint = leadToLead(space: theLeft)
            dict[constraint.identifier!] = constraint
        }
        if let theTop = top {
            let constraint = topToTop(space: theTop)
            dict[constraint.identifier!] = constraint
        }
        
        if let theRight = right {
            let constraint = trailToTrail(space: -theRight)
            dict[constraint.identifier!] = constraint
        }
        
        if let theBottom = bottom {
            let constraint = bottomToBottom(space: -theBottom)
            dict[constraint.identifier!] = constraint
        }
        
        return dict
        
    }
    
    func mt_InnerAlign(edge edge: UIEdgeInsets) -> [String: NSLayoutConstraint] {
        let lead = leadToLead(space: edge.left)
        let trail = trailToTrail(space: -edge.right)
        let top = topToTop(space: edge.top)
        let bottom = bottomToBottom(space: -edge.bottom)
        var dict = [String: NSLayoutConstraint]()
        dict[lead.identifier!] = lead
        dict[trail.identifier!] = trail
        dict[top.identifier!] = top
        dict[bottom.identifier!] = bottom
        return dict
    }
    
    func mt_InnerAlign() -> [String: NSLayoutConstraint]{

        let dict = mt_InnerAlign(allSpace: 8.0)
        return dict
    }
    
    func mt_InnerAlign(allSpace space: CGFloat)-> [String: NSLayoutConstraint] {
        let edge = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        let dict = mt_InnerAlign(edge: edge)
        return dict
        
    }
    
    func mt_InnerAlign(leftAndRight x: CGFloat, topAndBottom y: CGFloat)-> [String: NSLayoutConstraint]{
        let edge = UIEdgeInsets(top: x, left: y, bottom: x, right: y)
        let dict = mt_InnerAlign(edge: edge)
        return dict
    }
    
    func mt_InnerAlign(topLeftRight space: CGFloat, height: CGFloat?)-> [String: NSLayoutConstraint] {
        var dict = [String: NSLayoutConstraint]()
        
        let lead = leadToLead(space: space)
        let trail = trailToTrail(space: -space)
        let top = topToTop(space: space)
        var heightConstraint: NSLayoutConstraint? = nil
        if let _height = height {
            heightConstraint = equalHeight(height: _height)
            dict[heightConstraint!.identifier!] = heightConstraint
        }
        
        dict[lead.identifier!] = lead
        dict[trail.identifier!] = trail
        dict[top.identifier!] = top
        
        return dict
    }
    
    
    //MARK: - Basic constrail
    func equalWidth (width: CGFloat, priority: Float = 1000) -> NSLayoutConstraint{
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: NSLayoutConstraint.Attribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1,
                constant: width)
            constraint.identifier = kConstraintType.outerEqualWidth
      
        constraint.priority = priority
        self.addConstraint(constraint)
        return constraint
    }
    
    func equalHeight(height: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1,
                constant: height)
            constraint.identifier = kConstraintType.innerEqualHeight
        
        constraint.priority = priority
        self.addConstraint(constraint)
        return constraint

    }
    
    func equalHeightTo(view view: UIView, priority: Float = 1000) -> NSLayoutConstraint {
        
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: 0)
        constraint.identifier = kConstraintType.outerEqualHeight
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    func equalWidthTo(view view: UIView, priority: Float = 1000) -> NSLayoutConstraint {
        
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: 0)
        constraint.identifier = kConstraintType.outerEqualWidth
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    func centerYToCenterY (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerCenterYToCenterY
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerCenterYToCenterY
        }

        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    func centerXToCenterX (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerCenterXToCenterX
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerCenterXToCenterX
        }

        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    
    func leadToLead (toView v: UIView? = nil, space: CGFloat,priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerLeadToLead

        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerLeadToLead
        }

        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    func trailToTrail (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTrailToTrail

        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTrailToTrail

        }
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    
    func topToTop (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTopToTop
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTopToTop
        }

        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    func bottomToBottom (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerBottomToBottom

        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerBottomToBottom

        }
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
}
//MARK: - OUTER


extension UIView {
    
    func mt_OuterAlign(pinTo: PinOuterPosition, toView v: UIView,space: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]{
        switch pinTo {
        case .BottomLeft:
            return bottomLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .LowerLeft:
            return lowerLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .Left:
            return leftFromView(toView: v, gap: space, size: size, offset:  offset)
        case .HigherLeft:
            return higherLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .TopLeft:
            return topLeftFromView(toView: v, gap: space, size: size, offset: offset)
        case .LefterTop:
            return lefterTopFromView(toView: v, gap: space, size: size, offset: offset)
        case .Top:
            return topFromView(toView: v, gap: space, size: size, offset: offset)
        case . RighterTop:
            return righterTopFromView(toView: v, gap: space, size: size, offset: offset)
        case .TopRight:
            return topRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .HigherRight:
            return higherRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .Right:
            return rightFromView(toView: v, gap: space, size: size, offset: offset)
        case .LowerRight:
            return lowerRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .BottomRight:
            return bottomRightFromView(toView: v, gap: space, size: size, offset: offset)
        case .LefterBottom:
            return lefterBottomFromView(toView: v, gap: space, size: size, offset: offset)
        case .Bottom:
            return bottomFromView(toView: v, gap: space, size: size, offset: offset)
        case .RighterBottom:
            return righterBottomFromView(toView: v, gap: space, size: size, offset: offset)
        }
    }
    
    //MARK: - BASE POSITION
    
    private func bottomLeftFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lowerLeftFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToBottom(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func leftFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = centerYToCenterY(toView: v, space: offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func higherLeftFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToTop(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    //MARK: TOP
    private func topLeftFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToLead(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lefterTopFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToLead(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func topFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = bottomToTop(toView: v, space: -gap + offset.vertical)
        let constraint2 = centerXToCenterX(toView: v, space: offset.horizontal)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    private func righterTopFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToTrail(toView: v, space: -gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    //MARK: RIGHT
    private func topRightFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToTop(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func higherRightFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToTop(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func rightFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = centerYToCenterY(toView: v, space: offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func lowerRightFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = bottomToBottom(toView: v, space: -gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    // MARK: BOTTOM
    
    private func bottomRightFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToTrail(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func righterBottomFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = trailToTrail(toView: v, space: -gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    private func bottomFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = topToBottom(toView: v, space: gap + offset.vertical)
        let constraint2 = centerXToCenterX(toView: v, space: offset.horizontal)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    
    private func lefterBottomFromView (toView v: UIView, gap: CGFloat, size: CGSize?, offset: UIOffset = UIOffset(horizontal: 0, vertical: 0)) -> [String: NSLayoutConstraint]
    {
        var dict = [String: NSLayoutConstraint]()
        let constraint1 = leadToLead(toView: v, space: gap + offset.horizontal)
        let constraint2 = topToBottom(toView: v, space: gap + offset.vertical)
        
        dict[constraint1.identifier!] = constraint1
        dict[constraint2.identifier!] = constraint2
        
        if let _size = size {
            let sizeConstraint = mt_SetSize (_size)
            for (key, constraint) in sizeConstraint{
                dict[key] = constraint
            }
        }
        return dict
    }
    
    
    //MARK: - BASE CONSTRAINT
    private func trailToLead (toView v: UIView? = nil, space: CGFloat,priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTrailToLead
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTrailToLead
        }
        
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    
    private func leadToTrail (toView v: UIView? = nil, space: CGFloat,priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerLeadToTrail
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerLeadToTrail
        }
        
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    
    private func topToBottom (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerTopToBottom
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerTopToBottom
        }
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
        
    }
    
    
    private func bottomToTop (toView v: UIView? = nil, space: CGFloat, priority: Float = 1000) -> NSLayoutConstraint {
        if self.translatesAutoresizingMaskIntoConstraints == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint :NSLayoutConstraint!
        if let theV = v{
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: theV,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.outerBottomToTop
        } else {
            constraint = NSLayoutConstraint(item: self,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: superview!,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1,
                constant: space)
            constraint.identifier = kConstraintType.innerBottomToTop
        }
        
        constraint.priority = priority
        superview?.addConstraint(constraint)
        return constraint
    }
    // MARK: - SPLIT VIEW
    func mt_splitVerticallyByViews (views: [UIView], edge: UIEdgeInsets, gap: CGFloat){
        let container = UIView()
        self.addSubview(container)
        
        container.mt_InnerAlign(edge: edge)
        
        for  v in views {
            container.addSubview(v)
        }
        
        views[0].mt_innerAlign(left: 0, top: 0, right: nil, bottom: 0)
        
        for (i,v) in views.enumerate() {
            if i > 0 {
                v.mt_SetSizeFromView(toView: views[0])
                v.mt_OuterAlign(PinOuterPosition.Right, toView: views[i-1], space: gap, size: nil)
            }
        }
        views.last!.mt_BasicConstraint(BasicConstraintType.TrailToTrail, toView: nil, space: 0)
    }
    
    func mt_splitHorizontallyByViews(views: [UIView], edge: UIEdgeInsets, gap: CGFloat){
        let container = UIView()
        self.addSubview(container)
        
        container.mt_InnerAlign(edge: edge)
        
        for  v in views {
            container.addSubview(v)
        }
        
        views[0].mt_innerAlign(left: 0, top: 0, right: 0, bottom: nil)
        
        for (i,v) in views.enumerate() {
            if i > 0 {
                v.mt_SetSizeFromView(toView: views[0])
                v.mt_OuterAlign(PinOuterPosition.Bottom, toView: views[i-1], space: gap, size: nil)
            }
        }
        views.last!.mt_innerAlign(left: nil, top: nil, right: nil, bottom: 0)
    }

}

