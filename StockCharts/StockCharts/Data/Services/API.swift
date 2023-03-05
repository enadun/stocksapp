//
//  API.swift
//  StockCharts
//
//  Created by Nadun De Silva on 5/3/23.
//

import Foundation

protocol API {
  func fetchStockData(for tiker: String, with timespan: String, completion: @escaping (Result<Any,Error>) -> Void)
  func fetchPortfolioData(completion: @escaping (Result<Any,Error>) -> Void)
}

enum APIError: Error {
  case unknownError
}

class APIImp: API {
  static let shared = APIImp()
  private let APIKEY = "" //Add your API key here from https://polygon.io/

  private init() {}
  
  func fetchStockData(for tiker: String, with duration: String, completion: @escaping (Result<Any,Error>) -> Void) {
    
    guard let  url = getStockDataURL(for: tiker, with: duration) else {
      completion(.failure(APIError.unknownError))
      return
    }
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      if let data = data,
         let infor = String(data: data, encoding: .utf8) {
        print(infor)
        completion(.success(infor))
        return
      }
      completion(.failure(APIError.unknownError))
    })
    
    task.resume()
  }
  
  func fetchPortfolioData(completion: @escaping (Result<Any,Error>) -> Void) {
    guard let  url = URL(string: "https://run.mocky.io/v3/2b63ba43-6440-4780-aa13-91e6d8247305") else {
      completion(.failure(APIError.unknownError))
      return
    }
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      if let data = data,
         let infor = String(data: data, encoding: .utf8) {
                completion(.success(infor))
                return
      }
      completion(.failure(APIError.unknownError))
    })
    
    task.resume()
  }
 
  private func getStockDataURL(for tiker: String, with duration: String) -> URL? {
    // Since the current date values are delayd in the API, always getting the two days before as the current date
    let currentDate = Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
    let fromDate: Date?
    let multiplier: String
    let timespan: String
    switch duration {
    case "week":
      fromDate = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)
      timespan = "minute"
      multiplier = "10"
    case "month":
      fromDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)
      timespan = "minute"
      multiplier = "10"
    case "year":
      fromDate = Calendar.current.date(byAdding: .year, value: -1, to: currentDate)
      timespan = "day"
      multiplier = "5"
    default: //"day"
      fromDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)
      timespan = "minute"
      multiplier = "5"
    }
    let toDateString = getDateString(for: currentDate)
    let fromDateString = getDateString(for: fromDate ?? currentDate)
    let str = "https://api.polygon.io/v2/aggs/ticker/\(tiker.uppercased())/range/\(multiplier)/\(timespan)/\(fromDateString)/\(toDateString)?adjusted=true&sort=asc&limit=200&apiKey=\(APIKEY)"
    return URL(string: str)
  }
}
