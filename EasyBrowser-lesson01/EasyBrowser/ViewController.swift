/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBAction func goBack(_ sender: UIButton) {
        if webView.canGoBack{
        webView.goBack()
        } else {
            sender.isEnabled = false
        }
    }
    
    @IBAction func goForward(_ sender: UIButton) {
        if webView.canGoForward{
            webView.goForward()
        } else {
            sender.isEnabled = false
        }
    }
    
    @IBOutlet weak var goForward: UIBarButtonItem!
    @IBOutlet weak var goBack: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    
        if let url = URL(string: textField.text!){
            UserDefaults.standard.set(url, forKey: "savedUrl")
        webView.load(URLRequest(url: url))
            goForward.isEnabled = true
            goBack.isEnabled = true
        }
        return true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let savedUrl = UserDefaults.standard.url(forKey: "savedUrl"){
            webView.load(URLRequest(url: savedUrl))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

