//
//  ConciergeViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

class ConciergeViewController: UIViewController
{
    lazy var tableView: UITableView =
    {
        let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        return tableView
        }()
    
    override init()
    {
        super.init()
        
        self.title = NSLocalizedString("concierge_nav",
                                        comment: "")
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil,
            bundle: nibBundleOrNil)
    }
    
    override func loadView()
    {
        view = tableView
    }
}