//
//  ViewController.swift
//  GithubRepoSearcher
//
//  Created by Stuart Thomas on 30/08/2018.
//  Copyright © 2018 Stuart Thomas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let repos: [String] = ["Repo1", "Repo2", "Repo3", "Repo4", "Repo5"]
    var newRepos: [RepoModel] = []
    var arrRes = [[AnyHashable:AnyHashable]]() //Array of dictionary
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet  var repoTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let repositoryService = RepositoryService()
        var test = repositoryService.getData()
        print(test)
        
        
        // Register the table view cell class and its reuse id
        self.repoTableview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        repoTableview.delegate = self
        repoTableview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let repositoryService = RepositoryService()
        var test = repositoryService.getData()
        print(test)
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newRepos.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.repoTableview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        //cell.textLabel?.text = self.repos[indexPath.row]
        cell.textLabel?.text = self.newRepos[indexPath.row].name
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        valueToPass = currentCell.textLabel?.text
        performSegue(withIdentifier: "segueIdentifer", sender: self)
    }
    
    var valueToPass:String!
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "segueIdentifer") {
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destination as! DetailViewController
            // your new view controller should have property that will store passed value
            valueToPass = "test"
            viewController.passedValue = valueToPass
            //viewController.numberOfForks.text = valueToPass
        }
    }
}

