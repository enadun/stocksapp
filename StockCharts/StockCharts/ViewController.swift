//
//  ViewController.swift
//  StockCharts
//
//  Created by Nadun De Silva on 4/3/23.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  
  let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
  let api: API = APIImp.shared
  var flutterResult: FlutterResult?
  
  @IBOutlet weak var inputTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func viewStockChartAction(_ sender: UIButton) {
    if let ticker = inputTextField.text, !ticker.isEmpty {
      // And other validations
      navigateToFlutter(with: "/stockcharts")
    } else {
      // Inform
      let alert = UIAlertController(title: "Empty Ticker", message: "Please enter a ticker value", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default))
      present(alert, animated: true)
    }
  }
  
  @IBAction func viewProfileAction(_ sender: UIButton) {
    navigateToFlutter(with: "/portfolio")
  }
  
  private func navigateToFlutter(with route: String) {
    let viewController = FlutterViewController(project: nil, initialRoute: route, nibName: nil, bundle: nil)
    let channel = FlutterMethodChannel(name: "main_channel", binaryMessenger: viewController.binaryMessenger)
    channel.setMethodCallHandler(handleMessage)
    viewController.modalPresentationStyle = .fullScreen
    present(viewController, animated: true, completion: nil)
  }
  
  private func handleMessage(call: FlutterMethodCall, result: @escaping FlutterResult) {
    self.flutterResult = result
    switch call.method {
    case "get_portfolio":
      api.fetchPortfolioData { [weak self] in
      self?.sendResult(with: $0)
    }
    case "get_chart_data":
      let ticker = inputTextField.text ?? "USD"
      let duration = call.arguments as? String ?? "day"
      api.fetchStockData(for: ticker, with: duration) { [weak self] in
      self?.sendResult(with: $0)
    }
    default: result(nil)
    }
  }
  
  private func sendResult(with result: Result<Any, Error>) {
    switch result {
    case .success(let data): flutterResult?(data)
    case .failure( _): flutterResult?(nil)
    }
  }
}
