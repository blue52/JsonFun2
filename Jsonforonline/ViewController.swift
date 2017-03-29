//
//  ViewController.swift
//  Jsonforonline
//
//  Created by sky on 2017/3/27.
//  Copyright © 2017年 sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataArray = [AnyObject]()
    
    
    @IBOutlet weak var showLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")
        let urlResquest = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let task = URLSession.shared.dataTask(with: urlResquest) { (data:Data?, response: URLResponse?, err: Error?) in
            guard err == nil else{
                return
            }
            if let data = data{
                do {
                    let dic = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:AnyObject]
                    let array = dic["result"]!["results"] as! [[String:AnyObject]]
                    print(array)
                    self.showLabel.text = dic["HairType"] as? String
                    //print("\(dic["results"]!["results"]["HairType"])")
                }
                catch{
                
                }
            }
        }
        
        task.resume()
        
        
        
    }



}

