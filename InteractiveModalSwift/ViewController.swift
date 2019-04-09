//
//  ViewController.swift
//  InteractiveModalSwift
//
//  Created by Usue Napal on 09/04/2019.
//  Copyright © 2019 Usit Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func pressExample1()
    {
        let modal = BasicExampleViewController.init(topMargin: 250)
        modal.presentModalIn(controller: self)
    }
    
    @IBAction func pressExample2()
    {
        let modal = CollectionExampleViewController.init()
        modal.presentModalIn(controller: self)
    }
}

