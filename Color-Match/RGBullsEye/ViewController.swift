//
//  ViewController.swift
//  lab6_task5
//
//  Created by Екатерина Алейник on 20.04.25.
//
import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var targetTextLabel: UILabel!
  @IBOutlet weak var guessLabel: UILabel!
  
  @IBOutlet weak var redLabel: UILabel!
  @IBOutlet weak var greenLabel: UILabel!
  @IBOutlet weak var blueLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  let game = BullsEyeGame()
  var rgb = RGB()
  
  @IBAction func aSliderMoved(sender: UISlider) {
    switch sender {
    case redSlider:
      rgb.r = Int(sender.value)
      redLabel.text = "R \(rgb.r)"
    case greenSlider:
      rgb.g = Int(sender.value)
      greenLabel.text = "G \(rgb.g)"
    case blueSlider:
      rgb.b = Int(sender.value)
      blueLabel.text = "B \(rgb.b)"
    default: break
    }
    guessLabel.backgroundColor = UIColor(rgbStruct: rgb)
  }
  
  @IBAction func showAlert(sender: AnyObject) {
    // display target values beneath target color
    targetTextLabel.text = "R \(game.targetValue.r)   G \(game.targetValue.g)   B \(game.targetValue.b)"
    
    let difference = game.checkGuess(guess: rgb, target: game.targetValue)
    var title = "Try harder"  // default title if difference >= 10
    if difference == 0 {
      title = "Perfect!"
    } else if difference < 5 {
      title = "So close!"
    } else if difference < 10 {
      title = "Not bad"
    }
    
    let message = "you scored \(game.scoreRound) points"
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: { action in
      self.game.startNewRound()
      self.updateView()
    })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func startOver(sender: AnyObject) {
    game.startNewGame()
    updateView()
  }
  
  func updateView() {
    targetLabel.backgroundColor = UIColor(rgbStruct: game.targetValue)
    targetTextLabel.text = "match this color"
    
    rgb = game.startValue
    guessLabel.backgroundColor = UIColor(rgbStruct: rgb)
    redLabel.text = "R \(rgb.r)"
    greenLabel.text = "G \(rgb.g)"
    blueLabel.text = "B \(rgb.b)"
    
    redSlider.value = Float(rgb.r)
    greenSlider.value = Float(rgb.g)
    blueSlider.value = Float(rgb.b)
    
    roundLabel.text = "Round: \(game.round)"
    scoreLabel.text = "Score: \(game.scoreTotal)"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateView()
  }
}

