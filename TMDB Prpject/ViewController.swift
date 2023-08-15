//
//  ViewController.swift
//  TMDB Prpject
//
//  Created by 이승현 on 2023/08/14.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    var movieList: [Movie] = []
    
    var networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.CreditAPICallRequest(movieID: 45732) { data in
            print(data)
        }
        
    }
    
    

}
