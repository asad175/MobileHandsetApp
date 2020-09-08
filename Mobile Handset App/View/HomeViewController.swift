//
//  ViewController.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/4/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    var pager: PagerTabStripViewController!

    var dataSource: MobilesListDataSource?
    
    lazy var viewModel : HomeViewModel = {
        let viewModel = HomeViewModel(dataSource: dataSource)
        return viewModel
    }()
        
    override func viewDidLoad() {
        setupTabs()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func initializations() {
        dataSource = MobilesListDataSource(self)
    }
    
    func addObservers() {
        // add observers to listen when new data available
        self.dataSource?.data.addObserver(self) { [weak self] _ in
            // Callback from ViewModel when it receives data
            self?.loadingIndicator.stopAnimating()
            self?.refreshControl.endRefreshing()
            self?.tableView.reloadData()
        }
    }
    
    func initializeErrorHandler() {
        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] error in
            
            self?.loadingIndicator.stopAnimating()
            let controller = UIAlertController(title: NSLocalizedString("anErrorOccured", comment: ""), message: error?.localizedDescription, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
    }
    
    func loadContent() {
        self.viewModel.fetchMobiles()
    }

    // Related to Pages
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        pager = pagerTabStripController
        
        var arr = Array<MobilesListViewController>()
        var i = 0
        while i < 3 {
            let mobilesListViewController = self.storyboard!.instantiateViewController(withIdentifier: "MobilesListViewController") as!  MobilesListViewController
            mobilesListViewController.title = "Title"
            arr.append(mobilesListViewController)
            i += 1
        }
        return arr
    }
    
    func setupTabs() {
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .red
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 18)
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
    }

}

