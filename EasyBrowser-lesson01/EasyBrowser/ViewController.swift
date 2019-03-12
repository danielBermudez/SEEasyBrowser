/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {
    // UIApplication and UIApplicatonDelegate are both singletons UIApplication manages the events that occurs in the app, UIAplication creates a instance of the UIAplicationDelegate and informs to it the revelant events in the app like app launch or app termination.
    @IBAction func openPageInSafari(_ sender: UIButton) {
        // open http://developer.apple.com
        if let url = URL(string: " "){
            UIApplication.shared.openURL(url)
        }else{
            let alert = UIAlertController(title: "The URL is Invalid", message: "Please try again later.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

