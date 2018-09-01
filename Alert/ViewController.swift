//
//  ViewController.swift
//  Alert
//
//  Created by Citizen on 01.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumLabel: UILabel!
    @IBOutlet weak var computerNumLabel: UILabel!
    @IBOutlet weak var chekWinLabel: UILabel!
    var compNum: UInt32?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowButton(_ sender: Any) {
        let maxNum = 10
        alert(title: "Input number", message: "Number from 0 to 10", style: .alert, maxNum: maxNum)
    }
    
    
    func alert(title: String, message: String, style: UIAlertControllerStyle, maxNum: Int) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default){ (action) in
            let inputNum = alertController.textFields?.first?.text
            self.inputNumLabel.text = (inputNum ?? "no text")
            self.compNum = arc4random_uniform(UInt32(maxNum))
            self.computerNumLabel.text = String(self.compNum!)
            if self.compNum == UInt32(inputNum ?? "0") {
                self.chekWinLabel.text = "You win!"
            } else {
                self.chekWinLabel.text = "You lose!"
            }
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated:  true, completion: nil)
        
    }
    
    
}

