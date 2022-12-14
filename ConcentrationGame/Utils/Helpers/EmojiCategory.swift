//
//  EmojiCategory.swift
//  concentration
//
//  Created by qbuser on 01/12/22.
//

import Foundation

enum Emojicategory {
    case smiley
    case animal
    case nature
    case food
    case activity
    case object
    case symbol
    case flag
    case transportation
    case space
    
    func getEmojis() -> [String] {
        switch self {
        case .smiley:
            return ["๐","๐","๐","๐","๐","๐ฅน","๐","๐","๐คฃ","๐ฅฒ","โบ๏ธ","๐","๐","๐","๐","๐","๐","๐","๐ฅฐ","๐","๐","๐","๐","๐","๐","๐","๐","๐คช","๐คจ","๐ง","๐ค","๐","๐ฅธ","๐คฉ","๐ฅณ", "๐", "๐","๐","๐","๐","๐","โน๏ธ","๐ฃ","๐","๐ซ","๐ฉ","๐ฅบ","๐ข","๐ญ","๐ค","๐ ","๐ก","๐คฌ"]
        case .animal:
            return ["๐ถ", "๐ฑ", "๐ญ", "๐ท", "๐ฎ", "๐จ", "๐", "๐ฆ", "๐ป", "๐ธ", "๐", "๐ผ"]
        case .nature:
            return ["๐ต", "๐ฒ", "๐ณ", "๐ด", "๐", "๐", "๐", "๐", "๐", "๐ฅ", "๐ธ", "๐ป"]
        case .food:
            return ["๐ช", "๐ฉ", "๐ฟ", "๐ซ", "๐ฌ", "๐ญ", "๐ฎ", "๐", "๐ฐ", "๐ง", "๐ฅง", "๐ฆ", "๐จ", "๐ง", "๐ก", "๐ข", "๐ฅฎ", "๐ฅ ", "๐ฅ", "๐", "๐", "๐", "๐ค", "๐ฆช", "๐ฅ", "๐ฑ", "๐ฃ", "๐", "๐ฒ", "๐", "๐", "๐ฅ", "๐ซ", "๐ฏ",  "๐ฎ", "๐ง", "๐ฅ", "๐ฅช", "๐ซ", "๐", "๐","๐","๐ญ"]
        case .activity:
            return []
        case .object:
            return [  "โ๏ธ",   "๐ฑ",   "๐ฒ",   "๐ป",   "โจ๏ธ",   "๐ฅ๏ธ",   "๐จ๏ธ",   "๐ฑ๏ธ",   "๐ฒ๏ธ",   "๐น๏ธ",   "๐๏ธ",   "๐ฝ",   "๐พ",   "๐ฟ",   "๐",   "๐ผ",   "๐ท",   "๐ธ",   "๐น",   "๐ฅ",   "๐ฝ๏ธ",    "๐๏ธ",   "๐",   "โ๏ธ",   "๐",   "๐ ",   "๐บ",   "๐ป",   "๐๏ธ",   "๐งญ",   "โฑ๏ธ",   "โฒ๏ธ",   "โฐ",   "๐ฐ๏ธ",   "โ๏ธ",   "โณ",   "๐ก"]
        case .symbol:
            return [  "โค๏ธ",   "๐งก",   "๐",   "๐",   "๐",   "๐",   "๐ค",   "๐ค",   "๐ค",   "๐",   "โค๏ธโ๐ฅ",   "โค๏ธโ๐ฉน",   "โฃ๏ธ",   "๐",   "๐",   "๐",   "๐",   "๐",   "๐",   "๐",   "๐"]
        case .flag:
            return ["๐บ๐ณ", "๐ฆ๐ซ",  "๐ฆ๐ฝ",   "๐ฆ๐ฑ",  "๐ฉ๐ฟ",   "๐ฆ๐ธ",   "๐ฆ๐ฉ",   "๐ฆ๐ด",   "๐ฆ๐ฎ",   "๐ฆ๐ถ",   "๐ฆ๐ฌ",   "๐ฆ๐ท",   "๐ฆ๐ฒ",   "๐ฆ๐ผ",   "๐ฆ๐บ",   "๐ฆ๐น",   "๐ฆ๐ฟ",   "๐ง๐ธ",   "๐ง๐ญ",   "๐ง๐ฉ",   "๐ง๐ง",   "๐ง๐พ",   "๐ง๐ช",   "๐ง๐ฟ",   "๐ง๐ฏ",   "๐ง๐ฒ",   "๐ง๐น",    "๐ง๐ด",   "๐ง๐ฆ",   "๐ง๐ผ",   "๐ง๐ท",   "๐ป๐ฌ",   "๐ง๐ณ",   "๐ง๐ฌ",   "๐ง๐ซ",   "๐ง๐ฎ",   "๐ฐ๐ญ",    "๐จ๐ฒ",   "๐จ๐ฆ",   "๐ฎ๐จ",   "๐จ๐ป",    "๐ง๐ถ",   "๐จ๐ซ",   "๐ฎ๐ด",   "๐จ๐ฑ",   "๐จ๐ณ",   "๐จ๐ฝ",   "๐จ๐จ",   "๐จ๐ด",   "๐ฐ๐ฒ",   "๐จ๐ฌ",   "๐จ๐ฉ",   "๐จ๐ท",   "๐จ๐ฎ",   "๐ญ๐ท"]
        case .transportation:
            return ["๐", "โ๏ธ", "๐", " ๐ณ", "๐ต", "๐", "๐", "๐ด", "๐", "๐ ", "๐ถ"]
        case .space:
            return ["๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "โญ๏ธ","๐", "๐", "๐", "โ๏ธ", "โจ", "๐", "๐ช", "๐ฅ"]
        }
    }
}
