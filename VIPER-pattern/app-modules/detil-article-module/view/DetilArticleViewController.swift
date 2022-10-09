//
//  DetilArticleViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetilArticleViewController: UIViewController {

    var detilArticlePresenter:ViewToPresenterDetilArticleProtocol?
    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var lblTitleArticle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblBriefArticle: UILabel!
    
    
    var arrayList:Array<DetilArticleModel> = Array()
    var detilArticleModel:ArticleModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        
    }
    @IBAction func btnBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnDetil(_ sender: Any) {
        detilArticlePresenter?.showWebViewArticleController(navigationController: navigationController!, detilArticleModel: self.detilArticleModel!)
        
    }
}

extension DetilArticleViewController:PresenterToViewDetilArticleProtocol{
    
    func initView(){
        self.lblTitleArticle.text = self.detilArticleModel?.title
        self.lblBriefArticle.text = self.detilArticleModel?.brief
        self.lblDesc.text = self.detilArticleModel?.content
        
        Alamofire.request(self.detilArticleModel!.filesource).responseData { (response) in
            if response.error == nil {
                print(response.result)
                                if let data = response.data {
                    self.imgArticle.image = UIImage(data: data)
                }
            }
        }
    }
    
    func onDetilArticleResponseSuccess(detilArticleModelArrayList: Array<DetilArticleModel>) {
        
        self.arrayList = detilArticleModelArrayList
        hideProgressIndicator(view: self.view)
        
    }
    
    func onDetilArticleResponseFailed(error: String) {
        
        
    }
    
    
}
