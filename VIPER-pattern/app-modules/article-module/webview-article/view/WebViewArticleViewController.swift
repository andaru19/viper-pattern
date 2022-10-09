//
//  WebViewArticleViewController.swift
//  VIPER-pattern
//
//  Created by Andaru on 09/10/22.
//  Copyright © 2022 Tootle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import WebKit

class WebViewArticleViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    var webViewArticlePresenter:ViewToPresenterWebViewArticleProtocol?
    
    var detilArticleModel:ArticleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        
    }
    @IBAction func btnBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}

extension WebViewArticleViewController:PresenterToViewWebViewArticleProtocol{
    
    func initView(){
        webview.navigationDelegate = self
        let url = URL(string: (detilArticleModel?.url)!)!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
    }
    
    func onWebViewArticleResponseSuccess(detilArticleModelArrayList: DetilArticleModel) {
        
        
    }
    
    func onWebViewArticleResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Article", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
