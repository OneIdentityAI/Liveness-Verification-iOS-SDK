//
//  ViewController.swift
//  MobileLivenessTest
//
//  Created by Ho Chan Kit on 13/06/2019.
//  Copyright © 2019 Pixelogy Network Sdn Bhd. All rights reserved.
//

import UIKit
import LivenessVerification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonLivenessClicked(_ sender: UIButton)
    {
        let frameworkBundle = Bundle(identifier: "ai.1id.liveness.ios.LivenessVerification")
        //let storyboard = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle)
        
        if let viewController = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle).instantiateViewController(withIdentifier: "LivenessViewControllerID") as? LivenessViewController
        {
            viewController.token = "76d4098537eefb89d98a31c5d2a48cdc9c51c5a01c8becef1591c5de15f490b28e6a135425007f8c1b1c950ecf2399cb00aee878105b6ddfe7327ad848427718"
            viewController.apikey = "9c24abc8797a4554a54f3c6c26c705d9"
            viewController.callback = { message in
                let alert = UIAlertController(title:"Response", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                }))
                self.present(alert, animated: true)
            }
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}

