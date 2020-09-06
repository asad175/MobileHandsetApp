//
//  MobilesListViewController.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/5/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MobilesListViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: title);
    }

}
