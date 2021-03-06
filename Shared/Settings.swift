/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation

struct Settings {
    static let SuiteName = "group.org.mozilla.ios.Focus"

    static let KeyBlockAds = "BlockAds"
    static let KeyBlockAnalytics = "BlockAnalytics"
    static let KeyBlockSocial = "BlockSocial"
    static let KeyBlockOther = "BlockOther"
    static let KeyBlockFonts = "BlockFonts"
    static let KeyIntroDone = "IntroDone"

    static func registerDefaults() {
        set(true, forKey: KeyBlockAds)
        set(true, forKey: KeyBlockAnalytics)
        set(true, forKey: KeyBlockSocial)
        set(false, forKey: KeyBlockOther)
        set(false, forKey: KeyBlockFonts)
    }

    static func getBool(name: String) -> Bool? {
        return NSUserDefaults(suiteName: SuiteName)?.objectForKey(name) as? Bool
    }

    static func set(value: Bool, forKey key: String) {
        if let defaults = NSUserDefaults(suiteName: SuiteName) {
            defaults.setBool(value, forKey: key)
            defaults.synchronize()
        }
    }
}