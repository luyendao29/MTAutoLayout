//
//  ViewController2.swift
//  MTAutoLayout
//
//  Created by Minh Thang on 11/22/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let view4 = UIView()
        view.mt_splitHorizontallyByViews(views: [view1,view2,view3,view4], edge: UIEdgeInsets(top: 20, left: 30, bottom: 40, right: 50), gap: 5)
        view1.backgroundColor = UIColor.greenColor
        view2.backgroundColor = UIColor.blueColor
        view3.backgroundColor = UIColor.purpleColor
        view4.backgroundColor = UIColor.redColor

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
