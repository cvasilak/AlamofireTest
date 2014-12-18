//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Christos Vasilakis on 12/18/14.
//  Copyright (c) 2014 AeroGear. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let data = "Lorem ipsum dolor sit amet".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        let request = NSMutableURLRequest(URL:  NSURL(string: "http://httpbin.org/post")!)
        request.HTTPMethod = "POST"
        
        // instance (cancel)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let manager = Alamofire.Manager(configuration: configuration)
        manager.upload(request, data:data!)
            .progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) -> Void in
                println(bytesWritten)
            }
            .response { (request, response, _, error) in
                println(error)
                println(response)
            }
        
        //shared with Alamofire prefix (succeeds)
        Alamofire.upload(request, data!)
            .progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
                println(bytesWritten)
            }
            .response { (request, response, _, error) in
                println(error)
                println(response)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

