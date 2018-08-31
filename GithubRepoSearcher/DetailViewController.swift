//
//  DetailViewController.swift
//  GithubRepoSearcher
//
//  Created by Stuart Thomas on 30/08/2018.
//  Copyright © 2018 Stuart Thomas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var numberOfForks: UILabel!
    
    var passedValue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passed value")
        print(passedValue)
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        numberOfForks.text = "passedValue"
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNumberOfForks(forks: String) {
        numberOfForks.text = forks
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
