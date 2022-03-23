//
//  ViewController.swift
//  MemeMaker
//
//  Created by Noor Mehai on 3/22/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var topControl: UISegmentedControl!
    @IBOutlet weak var bottomControl: UISegmentedControl!
    var captionOption = CaptionOption()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topControl.removeAllSegments()
        buildChoices()
        for i in 0...captionOption.choicesLogo.count - 1{
            topControl.insertSegment(withTitle: captionOption.choicesLogo[i][0], at: i, animated: false)
        }
        
        topControl.selectedSegmentIndex = 0
        
        setup()
        
    }

    @IBAction func topControlValue(_ sender: UISegmentedControl) {
        changeScene(index: topControl.selectedSegmentIndex)
    }
    
    @IBAction func bottomControlValue(_ sender: UISegmentedControl) {
        let selectedArray = captionOption.choices[topControl.selectedSegmentIndex]
        bottomText.text = selectedArray[bottomControl.selectedSegmentIndex + 1]
    }
    
    func buildChoices(){
        captionOption = CaptionOption()
        
        //First Scene
        captionOption.choices.append(["That moment when...", "you see your teacher in public", "you see someone eating your food", "you realize they're crazy"])
        captionOption.choicesLogo.append(["TMW...", "🧑‍🏫", "🍔", "🤪"])
        
        //Second Scene
        captionOption.choices.append(["Did you say...", "the Earth is flat?", "you like memes?"])
        captionOption.choicesLogo.append(["DYS...", "🌎", "🤣"])
    }
    
    func setup(){
        //Put the values for the top segmented control
        for i in 0...captionOption.choices.count - 1{
            topControl.setTitle(captionOption.choicesLogo[i][0], forSegmentAt: i)
        }
        
        //Have the first of both segment controls selected
        changeScene(index: 0)
    }
    
    func changeScene(index: Int){
        let selectedArray = captionOption.choices[index]
        let selectedArrayLogo = captionOption.choicesLogo[index]
        topText.text = selectedArray[0]
        bottomControl.removeAllSegments()
        for i in 1...selectedArray.count-1 {
            bottomControl.insertSegment(withTitle: selectedArrayLogo[i], at: i, animated: false)
        }
        
        bottomControl.selectedSegmentIndex = 0
        bottomText.text = selectedArray[1]
    }
    
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed{
            topText.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed{
            bottomText.center = sender.location(in: view)
        }
    }
}

