//
//  ViewController.swift
//  PremiaMobile
//
//  Created by Justin Scofield on 4/16/22.
//

import UIKit
import Charts

class ViewController: UIViewController {
        
    let tdManager = TDManager()
    
    func testPriceHistory() {
        tdManager.getPriceHistory(ticker: "TLT")
    }

    /**
     * @brief Additional loading procedures
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        testPriceHistory()
    }

}

