//
//  BullsEyeGame.swift
//  lab6_task5
//
//  Created by Екатерина Алейник on 20.04.25.
//
import Foundation
import UIKit


class BullsEyeGame {
  var round = 0
  let startValue = RGB()
  var targetValue = RGB()
  var scoreRound = 0
  var scoreTotal = 0
  
  init() {
    startNewGame()
  }
  
  func startNewGame() {
    round = 0
    scoreTotal = 0
    startNewRound()
  }
  
  func startNewRound() {
    round = round + 1
    scoreRound = 0
    targetValue.r = Int.random(in:0..<256)
    targetValue.g = Int.random(in:0..<256)
    targetValue.b = Int.random(in:0..<256)
  }
  
  func checkGuess(guess: RGB, target: RGB) -> Int {
    let difference = guess.difference(target: targetValue)
    scoreRound = Int((1.0 - difference) * 100.0 + 0.5)
    scoreTotal = scoreTotal + scoreRound
    
    return 100 - scoreRound
  }
}
