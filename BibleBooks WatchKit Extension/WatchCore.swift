//
//  WatchCore.swift
//  BibleBooks
//
//  Created by Brennan Linse on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit

class WatchCore: NSObject
{
    static let bibleBooksString = "Genesis,Exodus,Leviticus,Numbers,Deuteronomy,Joshua,Judges,Ruth,1 Samuel,2 Samuel,1 Kings,2 Kings,1 Chronicles,2 Chronicles,Ezra,Nehemiah,Esther,Job,Psalms,Proverbs,Ecclesiastes,Song of Solomon,Isaiah,Jeremiah,Lamentations,Ezekiel,Daniel,Hosea,Joel,Amos,Obadiah,Jonah,Micah,Nahum,Habakkuk,Zephaniah,Haggai,Zechariah,Malachi,Matthew,Mark,Luke,John,Acts,Romans,1 Corinthians,2 Corinthians,Galatians,Ephesians,Philippians,Colossians,1 Thessalonians,2 Thessalonians,1 Timothy,2 Timothy,Titus,Philemon,Hebrews,James,1 Peter,2 Peter,1 John,2 John,3 John,Jude,Revelation"
    
    static let bibleBooksArray = WatchCore.bibleBooksString.componentsSeparatedByString(",")
    static var currCorrectBook = "Genesis"
    static var mixedBibleBooks = WatchCore.bibleBooksArray
    static var bibleBooksCopy = WatchCore.bibleBooksArray
    static var pickerArray = [String]()
    static var numGuesses = 0

}
