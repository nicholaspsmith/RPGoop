//
//  Enemy.swift
//  RPGoop
//
//  Created by Nick on 11/20/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import Foundation

class Enemy: Character {
  
  var loot: [String] {
    return ["Rusty Dagger", "Cracked Bat", "3 Gold Coins", "Piece of moldy cheese"]
  }
  
  var type: String {
    return "Goblin"
  }
  
  func dropLoot() -> String? {
    if !isAlive {
      let rand = Int(arc4random_uniform(UInt32(loot.count)))
      return loot[rand]
    }
    return nil
  }
}
