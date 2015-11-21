//
//  DevilWizard.swift
//  RPGoop
//
//  Created by Nick on 11/21/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
  
  override var loot: [String] {
     return ["Magic Wand", "Bronze Pentagram", "Scrying mirror"]
  }
  
  override var type: String {
    return "Devil Wizard"
  }
}
