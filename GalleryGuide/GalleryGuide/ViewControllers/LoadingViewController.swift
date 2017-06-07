//
//  LoadingViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoadingViewController: viewDidLoad")
        ExhibitionsModel.instance.loadExhibitions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        print("LoadingViewController: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LoadingViewController: viewDidAppear")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        let exhibitionsVC = storyboard.instantiateViewController(withIdentifier: "ExhibitionsViewController") as! ExhibitionsViewController
        exhibitionsVC.exhibitions = ExhibitionsModel.instance.exhibitions
        
        
        self.navigationController?.setViewControllers([exhibitionsVC], animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LoadingViewController: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LoadingViewController: viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
