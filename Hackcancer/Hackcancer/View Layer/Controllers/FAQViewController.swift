//
//  FAQViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import ReactiveCocoa
import UIKit

class FAQViewController: UIViewController
{
    lazy var tableView: UITableView =
    {
        let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        return tableView
        }()
    
    lazy var faqTableViewAdapter: FAQTableViewAdapter =
    {
        let adapter = FAQTableViewAdapter()
        return adapter
    }()
    
    lazy var faqStore: FAQStore =
    {
        return FAQStore()
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("faq_nav", comment: "")
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func loadView()
    {
        view = tableView
    }
    
    override func viewDidLoad()
    {
        tableView.dataSource = faqTableViewAdapter
        tableView.delegate = faqTableViewAdapter
        
        faqTableViewAdapter.tableView = tableView
        faqTableViewAdapter.setItems(faqStore.allItems(), animated:false)
        
        faqTableViewAdapter.selectionAction = Action
        {
            item in
            
            return SignalProducer
            {
                observer, disposable in
                let viewController = FAQItemViewController(item:item)
                self.navigationController?.pushViewController(viewController, animated: true)
                sendCompleted(observer)
            }
        }
    }
}