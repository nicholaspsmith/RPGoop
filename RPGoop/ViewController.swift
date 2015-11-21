//
//  ViewController.swift
//  RPGoop
//
//  Created by Nick on 11/20/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var chestButton: UIButton!
  @IBOutlet weak var printLabel: UILabel!
  @IBOutlet weak var playerHPLabel: UILabel!
  @IBOutlet weak var enemyHPLabel: UILabel!
  @IBOutlet weak var enemyImage: UIImageView!
  
  var player: Player!
  var enemy: Enemy!
  var chestMessage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    player = Player(name: "Avatar", hp: 120, attackPwr: 20)
    playerHPLabel.text = "\(player.hp)"
    
    generateRandomEnemy()
  }
  
  func generateRandomEnemy() {
    let rand = Int(arc4random_uniform(2))
    
    if rand == 0 {
      enemy = Chimera(startingHp: 50, attackPwr: 12)
    } else {
      enemy = DevilWizard(startingHp: 60, attackPwr: 15)
    }
  }
  
  @IBAction func onChestTapped(sender: AnyObject) {
    chestButton.hidden = true
    printLabel.text = chestMessage
    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
  }

  @IBAction func attackPressed(sender: AnyObject) {
    
    if enemy.attemptAttack(player.attackPwr) {
      printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
    } else {
      printLabel.text = "Attack was unsuccessful"
    }
    
    if let loot = enemy.dropLoot() {
      player.addItemToInventory(loot)
      chestMessage = "\(player.name) found \(loot)"
      chestButton.hidden = false
    }
    
    if !enemy.isAlive {
      enemyHPLabel.text = ""
      printLabel.text = "Killed \(enemy.type)"
      enemyImage.hidden = true
    }
  }
  
}

