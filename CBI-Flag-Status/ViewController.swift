//
//  ViewController.swift
//  CBI-Flag-Status
//
//  Created by TJ Boyle on 8/13/18.
//  Copyright © 2018 TJ Boyle. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let burgee: UIImage = UIImage(named:"burgee")!;
    let greenFlag: UIImage = UIImage(named:"green-flag")!;
    let yellowFlag: UIImage = UIImage(named:"yellow-flag")!;
    let redFlag: UIImage = UIImage(named:"red-flag")!;
    
    override func viewDidLoad() {
        print("Hello World")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://api2.community-boating.org/api/flag"
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            let string = String(data: data!, encoding: String.Encoding.utf8)
            print(string ?? "nil");
            
            DispatchQueue.main.async() {
                self.imageView.image = self.burgee;
                if (string == "var FLAG_COLOR = \"C\"") {
                    self.imageView.image = self.yellowFlag;
                }
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

