//
//  ArticleViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tvSearch: UITextField!
    var presenter:ViewToPresenterProtocol?
    var article:String?
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var articleArrayList:Array<ArticleModel> = Array()
    var filterSources :Array<ArticleModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvSearch.delegate = self
        tvSearch.placeholder = "Search " + (article ?? "")
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter?.startFetchingArticle(category: article!)
        showProgressIndicator(view: self.view)
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        }
    
    // UITextFieldDelegate
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          
        if tvSearch.text != "" {
            filterSources = articleArrayList.filter( { $0.title!.range(of: tvSearch.text!, options: .caseInsensitive) != nil})
            uiTableView.reloadData()
        } else {
            filterSources = articleArrayList
            uiTableView.reloadData()
        }
          return false
      }
    
    @IBAction func changeCategory(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension ArticleViewController:PresenterToViewProtocol{
    
    func showArticle(articleArray: Array<ArticleModel>) {

        
        if (self.articleArrayList.count == 0){
            self.filterSources = articleArray
            self.articleArrayList = articleArray
        } else {
            self.articleArrayList.insert(contentsOf: articleArray, at: 0)
            self.filterSources.insert(contentsOf: articleArray, at: 0)
        }
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
        
    }
    
    func showError() {

        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Article", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension ArticleViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
        cell.id.text = filterSources[indexPath.row].id
        cell.title.text = filterSources[indexPath.row].title
        cell.brief.text = filterSources[indexPath.row].brief
        cell.file_source.text = filterSources[indexPath.row].content

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       presenter?.showDetilArticleController(navigationController: navigationController!, detilArticleModel:filterSources[indexPath.row])

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // need to pass your indexpath then it showing your indicator at bottom
        
        let lastElement = filterSources.count - 1
        
        if (tvSearch.text == "" || tvSearch.text == nil) {
            if indexPath.row == lastElement{
                presenter?.startFetchingArticle(category: article!)
                showProgressIndicator(view: self.view)
            }
        }
        
        
    }
    
    
}

class ArticleCell:UITableViewCell{
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var file_source: UILabel!
    
}



