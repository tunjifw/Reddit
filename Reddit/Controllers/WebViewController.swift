//
//  WebViewController.swift
//  Reddit
//
//  Created by Folarin Williamson on 10/10/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    private var urlString: String!
    private let webview =  WKWebView()
    
    static func create(_ urlString: String) -> WebViewController {
        let vc: WebViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: String(describing: WebViewController.self))
        vc.urlString = urlString
        return vc
    }
    
    override func loadView() {
        super.loadView()
        self.view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }
}
