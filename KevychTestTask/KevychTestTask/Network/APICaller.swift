//
//  APICaller.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import Foundation


struct Constants {
    static let baseURL = "https://api.giphy.com"
    static let key = "sXRQb4oWV73Nv7clKLswn4vCErpUVlB8"
    static let searchLimit = "1" /* max value 4999*/
    static let offSet = "0" /* max value 20 */
    static let kindOFImage = "gifs"  /* it allso can  be "stickers" */
    static let searchLanguage = "en" /* it also can be (es , pt, id, fr, ar, tr, th, vi, de, it, ja, zh-CN, zh-TW, ru, ko, pl, nl, ro, hu,                                  sv, cs, hi, bn, da,fa, tl, fi, iw, ms, no, uk) */
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    
    static let shared = APICaller()
    
    
    func getMovies(keyValue: String ,completion: @escaping (Result<StoringModel?, Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/v1/gifs/search?api_key=\(Constants.key)&q=\(keyValue)&limit=\(Constants.searchLimit)&offset=\(Constants.offSet)&rating=g&lang=\(Constants.searchLanguage)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil  else { return }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data)
                guard let data = result.data.randomElement(),
                      let downloadedUrl = URL(string: data.images.original.url) else {
                          completion(.success(nil))
                          return
                      }
                self.downloaded(from: downloadedUrl) { result in
                    switch result {
                    case .success(let Imagedata):
                        let storedData = StoringModel(imageData: Imagedata, title: data.title, date: data.importDatetime)
                        completion(.success(storedData))
                    case .failure(let error):
                        print(error)
                    }
                }
            } catch  {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func downloaded(from url: URL, completeion: @escaping ( Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil
            else { print( String("HERE \(error?.localizedDescription)") )
                return }
            completeion(.success(data))
        }.resume()
    }
    
}





