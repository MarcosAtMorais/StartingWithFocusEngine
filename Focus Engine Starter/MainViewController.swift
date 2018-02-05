//
//  ViewController.swift
//  Focus Engine Starter
//
//  Created by Marcos Morais on 05/02/2018.
//  Copyright © 2018 Marcos Morais. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var focusableLabel: FocusableLabel!
    
    /// Atributo que determina qual será a view "preferida" da ViewController para a Focus Engine.
    override var preferredFocusedView: UIView? {
        return self.focusableLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

