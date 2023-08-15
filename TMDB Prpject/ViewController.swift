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
    var result: Movie?
    var networkManager = NetworkManager.shared
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.TrendAPICallRequest()
        
       // networkManager.CreditAPICallRequest(movieID: 45732) { data in
            //rint(data)
        }
        
    }
   
    
    



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //networkManager.result.Movie.results.count ?? 0
        //result?.Movie.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")!

        return cell
    }
    
    
    
}
