//
//  Chimera.swift
//  RPGoop
//
//  Created by Nick on 11/21/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import Foundation

class Chimera: Enemy {
  
  let IMMUNE_MAX = 15
  
  override var loot: [String] {
    return ["Golden rod", "Great broadsword", "Kimara venom"]
  }
  
  override var type: String {
    return "Chimera"
  }
  
  override func attemptAttack(attackPwr: Int) -> Bool {
    if attackPwr >= IMMUNE_MAX {
      return super.attemptAttack(attackPwr)
    } else {
      return false
    }
  }
}
