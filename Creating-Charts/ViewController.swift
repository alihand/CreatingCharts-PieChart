//
//  ViewController.swift
//  Creating-Charts
//
//  Created by Alihan Demir on 3.05.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart : PieChartView!
    @IBOutlet weak var iosStepper : UIStepper!
    @IBOutlet weak var macosStepper : UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        macDataEntry.value = macosStepper.value
        macDataEntry.label = "macOS"
        
        numberOfDownloadsDataEntries = [iosDataEntry,macDataEntry]
        updateChartData()
        
    }

    @IBAction func changeIOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }
 
    func updateChartData(){
        let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1.0)]
        
        chartDataSet.colors = colors 
        pieChart.data = chartData
        
        
        
    }
    
    
}

