//
//  Webservice.swift
//  StocksApp
//
//  Created by Mohammad Azam on 1/25/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
    case custom(String?)
}

class Webservice {
    
    func getStockArticlesByTitle(url: String, completion: @escaping ((Result<[StockArticle], NetworkError>) -> Void)) {
        
        guard let stockDetailsURL = URL(string: url) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: stockDetailsURL) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let stockDetailResponse = try? JSONDecoder().decode(StockArticleResponse.self, from: data)
            if let stockDetailResponse = stockDetailResponse {
                completion(.success(stockDetailResponse.articles))
            } else {
                completion(.failure(.decodingError))
            }
                        
        }.resume()
        
    }
    
    func saveStock(url: String, stock: Stock, completion: @escaping ((Result<Void, NetworkError>) -> Void)) {
        
        guard let addStockURL = URL(string: url) else {
            return completion(.failure(.badURL))
        }
        
        var request = URLRequest(url: addStockURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(stock)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let saveStockResponse = try? JSONDecoder().decode(SaveStockResponse.self, from: data)
            if let saveStockResponse = saveStockResponse {
                if saveStockResponse.success {
                    completion(.success(())) 
                } else {
                    completion(.failure(.custom(saveStockResponse.message)))
                }
                
            } else {
                completion(.failure(.custom("Request failed!")))
            }
            
        }.resume()
        
    }
    
    func getAllStocks(url: String, completion: @escaping (Result<[Stock]?, NetworkError>) -> Void) {
        
        guard let stocksURL = URL(string: url) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: stocksURL) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(.success(stocks))
            }
            
        }.resume()
        
    }
    
}
 
