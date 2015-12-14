//
//  Screen2IC.swift
//  BibleBooks
//
//  Created by Brennan Linse on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation


class Screen2IC: WKInterfaceController {
    @IBOutlet var thePicker: WKInterfacePicker!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var thePickerItems = [WKPickerItem]()
        for(var i = 0; i < WatchCore.pickerArray.count; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i].title = WatchCore.pickerArray[i]
        }
        self.thePicker.setItems(thePickerItems)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
