//
//  ExhibitionsViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ExhibitionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var exhibitions:[ExhibitionVO]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let exhibition = exhibitions[indexPath.row]
        cell.textLabel?.text = exhibition.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {        
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)!
            let exhibition = exhibitions[indexPath.row]
            
            let destination = segue.destination as! DetailsViewController
            destination.exhibition = exhibition
        }
    }
}
