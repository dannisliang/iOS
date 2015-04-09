//
//  Array+Functional.swift
//  Hackcancer
//
//  Created by James Campbell on 06/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

extension Array
{
    typealias Item = (index: Int, element: T)
    
    func each(block: (item: Item) -> Void)
    {
        for item in enumerate(self)
        {
            block(item:item)
        }
    }
    
    func filter(block: (item: Item) -> Bool) -> Array<T>
    {
        var newArray = Array<T>()
        
        self.each
        {
            if block(item:$0)
            {
                newArray.append($0.element)
            }
        }
        
        return newArray
    }
    
    func map(block: (item: Item) -> AnyObject) -> Array<AnyObject>
    {
        var newArray = Array<AnyObject>()
        
        self.each
        {
            let newElement: AnyObject = block(item:$0)
            newArray.append(newElement)
        }
        
        return newArray
    }
}