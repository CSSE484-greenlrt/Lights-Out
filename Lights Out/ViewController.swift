//
//  ViewController.swift
//  Lights Out
//
//  Created by Ryan Greenlee on 3/16/18.
//  Copyright © 2018 Ryan Greenlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameBoardButtons: [UIButton]!
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    var game = LinearLightsOutGame(numLights: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        updateView()
    }
    
    @IBAction func pressedNewGame(_ sender: Any) {
        game = LinearLightsOutGame(numLights: 13)
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
        let gameBoardButton = sender as! UIButton
        game.pressedLightAtIndex(gameBoardButton.tag)
        updateView()
    }
    
    func updateView() {
        var onImage: UIImage
        var offImage: UIImage
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            gameStateLabel.text = game.description
        } else {
            gameStateNavBar.topItem?.title = game.description
        }
        onImage = #imageLiteral(resourceName: "light_on")
        offImage = #imageLiteral(resourceName: "light_off")
        
        for i in 0..<13 {
            let button = gameBoardButtons[i]
            switch (game.lightStates[i]) {
            case true:
                button.setImage(onImage, for: UIControlState.normal)
            case false:
                button.setImage(offImage, for: UIControlState.normal)
            }
        }
    }
}

