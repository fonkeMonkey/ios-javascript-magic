//
//  ViewController.swift
//  iOSJavaScriptMagaic
//
//  Created by Pavol Virdzek on 09/02/2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: .zero, configuration: getCustomWebViewConfig())

        view.addSubview(webView)

        let layoutGuide = view.safeAreaLayoutGuide

        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

        if let url = URL(string: "https://www.google.com") {
            webView.load(URLRequest(url: url))
        }
    }

    func getCustomWebViewConfig() -> WKWebViewConfiguration{
        let contentController = WKUserContentController()
        let scriptSource = "document.body.style.backgroundColor = `orange`;"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        return config
    }
}

