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
            return ["😎", "🤪", "😁", "😍", "🤑", "😷", "😫", "🤩", "😅", "🤐", "😛", "😬"]
        case .animal:
            return ["🐶", "🐱", "🐭", "🐷", "🐮", "🐨", "🙉", "🦊", "🐻", "🐸", "🐙", "🐼"]
        case .nature:
            return ["🌵", "🌲", "🌳", "🌴", "🎋", "💐", "🍀", "🍁", "🍄", "🥀", "🌸", "🌻"]
        case .food:
            return []
        case .activity:
            return []
        case .object:
            return [  "⌚️",   "📱",   "📲",   "💻",   "⌨️",   "🖥️",   "🖨️",   "🖱️",   "🖲️",   "🕹️",   "🗜️",   "💽",   "💾",   "💿",   "📀",   "📼",   "📷",   "📸",   "📹",   "🎥",   "📽️",    "🎞️",   "📞",   "☎️",   "📟",   "📠",   "📺",   "📻",   "🎙️",   "🧭",   "⏱️",   "⏲️",   "⏰",   "🕰️",   "⌛️",   "⏳",   "📡"]
        case .symbol:
            return [  "❤️",   "🧡",   "💛",   "💚",   "💙",   "💜",   "🖤",   "🤍",   "🤎",   "💔",   "❤️‍🔥",   "❤️‍🩹",   "❣️",   "💕",   "💞",   "💓",   "💗",   "💖",   "💘",   "💝",   "💟"]
        case .flag:
            return ["🇺🇳", "🇦🇫",  "🇦🇽",   "🇦🇱",  "🇩🇿",   "🇦🇸",   "🇦🇩",   "🇦🇴",   "🇦🇮",   "🇦🇶",   "🇦🇬",   "🇦🇷",   "🇦🇲",   "🇦🇼",   "🇦🇺",   "🇦🇹",   "🇦🇿",   "🇧🇸",   "🇧🇭",   "🇧🇩",   "🇧🇧",   "🇧🇾",   "🇧🇪",   "🇧🇿",   "🇧🇯",   "🇧🇲",   "🇧🇹",    "🇧🇴",   "🇧🇦",   "🇧🇼",   "🇧🇷",   "🇻🇬",   "🇧🇳",   "🇧🇬",   "🇧🇫",   "🇧🇮",   "🇰🇭",    "🇨🇲",   "🇨🇦",   "🇮🇨",   "🇨🇻",    "🇧🇶",   "🇨🇫",   "🇹🇩",   "🇮🇴",   "🇨🇱",   "🇨🇳",   "🇨🇽",   "🇨🇨",   "🇨🇴",   "🇰🇲",   "🇨🇬",   "🇨🇩",   "🇨🇷",   "🇨🇮",   "🇭🇷"]
        case .transportation:
            return ["🚗", "✈️", "🚁", " 🛳", "🛵", "🚀", "🚑", "🛴", "🚅", "🚠", "🛶"]
        case .space:
            return ["🌝", "🌎", "🌚", "🌗", "🌙", "💫", "🌍", "⭐️","🌟", "🌛", "🌜", "☄️", "✨", "🌞", "🪐", "💥"]
        }
    }
}
