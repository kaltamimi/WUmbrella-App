//
//  NetworkService.swift
//  WeatherUmbrella
//
//  Created by Kawthar Khalid al-Tamimi on 11/12/2020.
//

import Foundation

class NetworkService {

    class func request<T: Codable>(router: Router ,completion: @escaping (T) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        
        guard let url = components.url else { return }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            guard response != nil, let data = data else {
                return
            }
            
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
            
            DispatchQueue.main.async {
                
                completion(responseObject)
            }
        }
        dataTask.resume()
    }

    
//    fileprivate func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
//        let url = URL(string: "\(weatherURL)")
//        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
//            if let error = err {
//                print("Failed to fetch data:", error)
//                delegate?.didFailWithError(error: error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let obj = try JSONDecoder().decode(T.self, from: data)
//                completion(obj)
//            } catch let jsonErr {
//                print("Failed to decode json:", jsonErr)
//                delegate?.didFailWithError(error: jsonErr)
//            }
//        }.resume()
//    }


    
}

