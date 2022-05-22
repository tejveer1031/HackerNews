//
//  NetworkManager.swift
//  HackerNews
//
//  Created by TEJVEER SINGH on 2022-05-19.
//

import Foundation

class NetrworkManager: ObservableObject{
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data,reponse,error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                      let Results =   try  decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = Results.hits
                            }
                           
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
