//
//  BasicExampleViewController.swift
//  InteractiveModalSwift
//
//  Created by Usue Napal on 09/04/2019.
//  Copyright © 2019 Usit Development. All rights reserved.
//

import UIKit

class BasicExampleViewController: InteractiveModal
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func pressCat()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
