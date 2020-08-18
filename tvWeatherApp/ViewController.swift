//
//  ViewController.swift
//  tvWeatherApp
//
//  Created by jose sanchez on 8/13/20.
//  Copyright © 2020 jose sanchez. All rights reserved.
//

import UIKit
//import CoreLocation
class ViewController: UIViewController {
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var mainDegreeLabel: UILabel!
    @IBOutlet var overviewConditionsLabel: UILabel!
    @IBOutlet var dewPointLabel: UILabel!
    //    let locator = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/41.8781,87.6298") {
            if let data = NSData(contentsOf: url as URL) {
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String:AnyObject]
                    let newDict = parsed
                    overviewConditionsLabel.text = newDict["currently"]!["summary"] as? String
                    dewPointLabel.text = newDict["currently"]!["dewPoint"] as? String
                    
                }
                catch let error as NSError {
                               print("Error: \(error)")
                           }

            }
            
        } 
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        locator.delegate = self
//        locator.desiredAccuracy = kCLLocationAccuracyBest
        
    }


}

