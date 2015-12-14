//
//  Screen1IC.swift
//  BibleBooks
//
//  Created by Brennan Linse on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation
import Parse


class Screen1IC: WKInterfaceController {

    @IBOutlet var theTable: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        //mix up the books
        for(var i = 0; i < WatchCore.bibleBooksArray.count; i++)
        {
            print("in loop")
            WatchCore.mixedBibleBooks[i] = WatchCore.bibleBooksCopy.removeAtIndex(random() % (WatchCore.bibleBooksCopy.count)+1)
        }
        self.generateTable()
        
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
    
    //what happens when table is clicked
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
        {
            WatchCore.numGuesses++
            //if we picked the right book
            if(WatchCore.currCorrectBook == WatchCore.mixedBibleBooks[rowIndex])
            {
                WatchCore.mixedBibleBooks.removeAtIndex(rowIndex)
                WatchCore.pickerArray.append(WatchCore.currCorrectBook)
                WatchCore.currCorrectBook = WatchCore.bibleBooksArray[WatchCore.pickerArray.count]
            }
            //if we won the game
            if(WatchCore.pickerArray.count = WatchCore.bibleBooksArray.count)
            {
                var attempt = PFObject(classname: "Attempt")
                attempt["numGuesses"] = WatchCore.numGuesses
                attempt.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success)
                    {
                        print("Attempt saved.")
                    }
                    else {
                        print(error!.description)
                    }
            }
        }

    func generateTable()
    {
        //configuring table
        self.theTable.setNumberOfRows(WatchCore.mixedBibleBooks.count, withRowType: "tableRow")
        for(var i = 0; i < WatchCore.mixedBibleBooks.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! tableRow
            currRow.tableLabel.setText("\(WatchCore.mixedBibleBooks[i])")
        }
            }
}