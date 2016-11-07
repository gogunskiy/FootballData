//
//  ViewController.swift
//  FootballData
//
//  Created by Volodymyr Hohunskyi on 11/07/2016.
//  Copyright (c) 2016 Volodymyr Hohunskyi. All rights reserved.
//

import UIKit
import FootballData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FDManager.fetchAllCompetitions(season: 2016) { (competitions) in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

