//
//  ViewController.swift
//  Web
//
//  Created by seong_wook_lim on 2021/11/29.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String)
    {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url:myUrl!)
        myWebView.load(myRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadWebPage("http://www.google.com")
        // Do any additional setup after loading the view.
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func checkUrl(_ url: String) -> String {
       var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage("http://www.naver.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage("http://www.daum.net")
    }
    
    @IBAction func btnHTML(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </hi><p> String 변수를 이용한 웹 페이지 </p><a href = \"http://www.nate.com\">nate</a>으로 이동<p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnFast_forward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

