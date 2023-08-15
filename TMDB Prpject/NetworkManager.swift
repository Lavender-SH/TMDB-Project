//
//  NetworkManager.swift
//  TMDB Prpject
//
//  Created by 이승현 on 2023/08/15.
//

import Foundation
import Alamofire
import Kingfisher

enum NetworkError: Error {
    case someError
}

class NetworkManager {
    
    var result: Movie?
    static let shared = NetworkManager()
    private init() {}
    
//    func TrendAPICallRequest() {
//        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.TMDBKey)"
//        AF.request(url, method: .get).validate().responseDecodable(of: Movie.self) { response in
//            print(response.value)
//            dump(response.value)
//            self.result = response.value
//
//            var movieID = result?.Movie.results.id
//            print(movieID)
//        }
//    }
        
        
        func TrendAPICallRequest() {
            let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.TMDBKey)"
            AF.request(url, method: .get).validate().responseDecodable(of: Movie.self) { [weak self] response in
                guard let self = self else { return }
                
                switch response.result {
                case .success(let movie):
                    self.result = movie
                    if let firstMovie = movie.results.first {
                        let movieID = firstMovie.id
                        print(movieID)
                        
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        
        
        //    func TrendAPICallRequest(completion: @escaping ([Result]?) -> Void) {
        //        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(APIKey.TMDBKey)"
        //        AF.request(url, method: .get).validate().responseDecodable(of: Movie.self) { response in
        //            switch response.result {
        //            case .success(let movie):
        //                completion(movie.results)
        //            case .failure(let error):
        //                print("Error fetching trending movies: \(error)")
        //                completion(nil)
        //            }
        //        }
        //    }
        
        //    func CreditAPICallRequest(movieID: Int, completion: @escaping ((Data?) -> Void)) {
        //        let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(APIKey.TMDBKey)"
        //        AF.request(url, method: .get).validate().responseDecodable(of: MovieID.self) { response in
        //            switch response.result {
        //            case .success(let response.value):
        //                completion(response.value)
        //            case .failure(let error):
        //                print("Error: \(error)")
        //                completion(nil)
        //            }
        //        }
        //    }
        
        func CreditAPICallRequest(movieID: Int, completion: @escaping (Data?) -> Void) {
            let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(APIKey.TMDBKey)"
            AF.request(url, method: .get).validate().response { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                    print(data)
                case .failure(let error):
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }
        
    }
    
