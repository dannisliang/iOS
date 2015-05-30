//
//  TableViewCell.swift
//  Hackcancer
//
//  Created by James Campbell on 29/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class TableViewCell: UITableViewCell
{
    class func identifier() -> String
    {
        return _stdlib_getDemangledTypeName(self)
    }
}