//
//  WebView.swift
//  SpaceNews
//
//  Created by Kevin Godbey on 8/10/22.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let noErrorString = urlString {
            if let url = URL(string: noErrorString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
            }
        }
    }
