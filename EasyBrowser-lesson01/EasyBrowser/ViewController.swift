/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit
import WebKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var webView: WKWebView!
    func loadPage(){
        if let url = URL(string: "http://developer.apple.com"){
            let request = URLRequest(url: url)
            webView.load(request)
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPage()
        webView.scrollView.delegate = self
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y == 0){
            toolBar.isHidden = false
        }else{
             toolBar.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

