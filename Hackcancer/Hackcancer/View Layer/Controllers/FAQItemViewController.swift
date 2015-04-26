//
//  FAQItemViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import UIKit

class FAQItemViewController: UIViewController
{
    lazy var descriptionLabel: UILabel =
    {
        return UILabel(frame: self.view.bounds)
    }()
    
    let item: FAQStore.Item
    
    init(item: FAQStore.Item)
    {
        self.item = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        self.item = aDecoder.decodeObjectForKey("item") as! FAQStore.Item
        
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = item.question
        self.descriptionLabel.text = item.answer
    }
    
    override func loadView()
    {
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad()
    {
        view.addSubview(self.descriptionLabel)
    }
}