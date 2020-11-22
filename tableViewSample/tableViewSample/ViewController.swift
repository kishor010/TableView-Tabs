//
//  ViewController.swift
//  tableViewSample
//
//  Created by Kishor Pahalwani on 04/07/19.
//  Copyright © 2019 Self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedDetails(_ sender: Any) {
        let detailsVC = DetailsViewController.init(nibName: "DetailsViewController", bundle: nil)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Home"
    }
}
