//
//  Utils.swift
//  StockCharts
//
//  Created by Nadun De Silva on 5/3/23.
//

import Foundation

func getDateString(for date: Date, format string: String = "YYYY-MM-dd") -> String{
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = string
  return dateFormatter.string(from: date)
}
