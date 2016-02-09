//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Hector Rios on 08/02/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: Controller Outlets
    @IBOutlet weak var logoImg : UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn:UIButton!
    @IBOutlet weak var tapsLbl: UILabel!

    // MARK: controller variables
    var currentTapCount = 0
    var maxTapCount = 0
    
    //MARK: IBActions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTapCount = Int(howManyTapsTxt.text!)!
            currentTapCount = 0
            
            self.updateTapsLbl()
        }
    }

    
    @IBAction func onCoinBtnPressed(sender: UIButton) {
        
        if isGameOver() {
            restartTheGame()
            return
        }
        
        currentTapCount++
        self.updateTapsLbl()
        
        
    }
    
    //MARK: controller functions
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTapCount) Taps"
    }
    
    func isGameOver() -> Bool {
        return (currentTapCount >= maxTapCount)
    }
    
    func restartTheGame() {
        maxTapCount = 0
        howManyTapsTxt.text = ""
        self.tapsLbl.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }
    
}

