//
//  HomeController.swift
//  PremiaMobile
//
//  Created by Justin Scofield on 4/17/22.
//

import UIKit
import Charts

class HomeController: UITabBarController {
    let candleStickChartView = CandleStickChartView()
    
    /**
     * @brief Initialize the chart data members
     *
     */
    func initChart(keys: [String], values: [Double])
    {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<keys.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        var colors: [UIColor] = []
        
        for _ in 0..<keys.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
                
        let candleChartDataSet = CandleChartDataSet(entries: dataEntries, label: "Units Sold")
        let candleChartData = CandleChartData(dataSet: candleChartDataSet)
        candleChartDataSet.colors = colors
        candleStickChartView.data = candleChartData
    }
    
    
    /**
     * @brief Additional loading procedures
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        candleStickChartView.noDataText = "You need to provide data for the chart."
    }
}
