//
//  DashboardViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 10/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {

    var presenter:ViewToPresenterDashboardProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    
    let categoryArrayList: [String] = ["All", "Finance", "Sport", "Travel", "Food", "Health"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.rowHeight = 50.0
        
        }
    
    @IBAction func btnListMovie(_ sender: Any) {
        presenter?.showListMovieController(navigationController: navigationController!)
    }
}

extension DashboardViewController:PresenterToViewDashboardProtocol{
    func onDashboardResponseSuccess(detilArticleModelArrayList: Array<DetilArticleModel>) {
        
    }
    
    func onDashboardResponseFailed(error: String) {
        
    }
    
    
    
  
    func showDashboard() {

       
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
        
    }
    
    func showError() {

        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Dashboard", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension DashboardViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardCell
//        cell.id.text = articleArrayList[indexPath.row].id
        cell.title.text = categoryArrayList[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDashboardController(navigationController: navigationController!, article: categoryArrayList[indexPath.row])

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
    }
    
    
}

class DashboardCell:UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    
}
