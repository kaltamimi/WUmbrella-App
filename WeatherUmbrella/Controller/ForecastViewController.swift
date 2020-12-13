//
//  ForecastViewController.swift
//  WeatherUmbrella
//
//  Created by Kawthar Khalid al-Tamimi on 12/12/2020.
//

import UIKit

class ForecastViewController: UIViewController {
    
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }
    
    @IBAction func dismissSecondVC(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
