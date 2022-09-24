//
//  MovieTrailerViewController.swift
//  Flix
//
//  Created by Trang Do on 9/23/22.
//

import UIKit
import WebKit
import Dispatch
class MovieTrailerViewController: UIViewController, WKUIDelegate {

    var trailerKey: String!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(trailerKey!)
        let trailerURL = URL(string: "https://www.youtube.com/watch?v=" + trailerKey)
        let myRequest = URLRequest(url: trailerURL!)
        webView.load(myRequest)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
