/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var completeLink = ""
        textField.resignFirstResponder()
        
        guard let urlString = textField.text else {
            return false
        }
        
        if validUrlFromString(urlString: urlString) {
            guard let url = URL(string: urlString) else {
                return false
            }
            
            webView.load(URLRequest(url: url))
        } else {
            completeLink = "http://\(urlString)"
            
            if validUrlFromString(urlString: completeLink) {
                guard let url = URL(string: completeLink) else {
                    return false
                }
                
                webView.load(URLRequest(url: url))
            } else {
                let alert = UIAlertController(title: "Invalid Url", message: "Please Try again", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
        
        return true
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func validUrlFromString(urlString: String) -> Bool{
        
        if ((urlString.hasPrefix("http://") || urlString.hasPrefix("https://")) && urlString.contains(".com")){
            return true
        }
        
        return false

    }
}

