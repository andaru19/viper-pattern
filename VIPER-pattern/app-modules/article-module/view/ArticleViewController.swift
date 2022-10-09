//
//  ArticleViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 08/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    var presenter:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var articleArrayList:Array<ArticleModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter?.startFetchingArticle()
        showProgressIndicator(view: self.view)
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        }
}

extension ArticleViewController:PresenterToViewProtocol{
    
    func showArticle(articleArray: Array<ArticleModel>) {

        
        if (self.articleArrayList.count == 0){
            self.articleArrayList = articleArray
        } else {
            self.articleArrayList.insert(contentsOf: articleArray, at: 0)
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
        return articleArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleCell
        cell.id.text = articleArrayList[indexPath.row].id
        cell.title.text = articleArrayList[indexPath.row].title
        cell.brief.text = articleArrayList[indexPath.row].brief
        cell.file_source.text = articleArrayList[indexPath.row].content

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       presenter?.showDetilArticleController(navigationController: navigationController!, detilArticleModel:articleArrayList[indexPath.row])

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // need to pass your indexpath then it showing your indicator at bottom
        
        let lastElement = articleArrayList.count - 1
        if indexPath.row == lastElement{
            presenter?.startFetchingArticle()
            showProgressIndicator(view: self.view)
        }
        
    }
    
    
}

class ArticleCell:UITableViewCell{
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var file_source: UILabel!
    
}



