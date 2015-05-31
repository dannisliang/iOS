//
//  AboutViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation
import MapKit

class AboutViewController: UIViewController
{
    lazy var contentTextView: UITextView =
    {
       return UITextView()
    }()
    
    lazy var mapView: MKMapView =
    {
       return MKMapView()
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("about_nav", comment:"Title for AboutViewController")
        
        contentTextView.text = NSLocalizedString("about_content_text", comment:"Content for AboutViewController")
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(contentTextView)
        view.addSubview(mapView)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}