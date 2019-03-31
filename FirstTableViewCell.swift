//
//  FirstTableViewCell.swift
//  卖机票
//
//  Created by 方瑾 on 2019/2/26.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var country1: UITextField!//出发国家
    
    @IBOutlet weak var country2: UITextField!//到达国家
    
    @IBOutlet weak var time1: UITextField!//出发时间
    
    @IBOutlet weak var time2: UITextField!//到达时间
    
    @IBOutlet weak var whichSeats: UITextField!//哪一个飞机舱
    
    @IBOutlet weak var yesOn: UITextField!//是否携带儿童
    
    @IBOutlet weak var danButton: UIButton!
    
    @IBOutlet weak var wanfangButton: UIButton!
    
    @IBOutlet weak var duoChengButton: UIButton!
    
    
    
    var country = ["杭州","北京","上海","厦门","西安","深圳","福州","武汉","成都","青岛","广州","大连","三亚","长沙","济南"]
    var yearArray = ["2019","2020","2021","2022","2023","2024","2025","2026","20227","2028","2029","2030","2031","2032","2033","2034","2035","2036","2037","2038","2039","2040","2041","2042","2043","2044","2045","2046","2047","2048","2049","2050"]

    var monthArray = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    var dayArray = ["1日","2日","3日","4日","5日","6日","7日","8日","9日","10日","11日","12日","13日","14日","15日","16日","17日","18日","19日","20日","21日","22日","23日","24日","25日","26日","27日","28日","29日","30日","31日"]
    var seat = ["经济舱","公务/头等舱"]
    var child = ["无","婴儿","儿童"]
    var num = 31
    var num1 = 31
    
    var yearnum = Int()
    var monthnum = Int()
    var daynum = Int()
    
    var yearnum1 = Int()
    var monthnum1 = Int()
    var daynum1 = Int()
 
    var inputCountry1PickerView = UIPickerView()
    var inputCountry2PickerView = UIPickerView()
    var time1PickerView = UIPickerView()
    var time2PickerView = UIPickerView()
    var whichSeatsPickerView = UIPickerView()
    var yesOnPickerView = UIPickerView()
    var count = Int()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //起飞城市
        country1.inputView = inputCountry1PickerView
        inputCountry1PickerView.delegate = self
        inputCountry1PickerView.dataSource = self
        //到达城市
        country2.inputView = inputCountry2PickerView
        inputCountry2PickerView.delegate = self
        inputCountry2PickerView.dataSource = self
        //出发时间
        time1.inputView = time1PickerView
        time1PickerView.delegate = self
        time1PickerView.dataSource = self
        //到达时间
        time2.inputView = time2PickerView
        time2PickerView.delegate = self
        time2PickerView.dataSource = self
        //选机舱
        whichSeats.inputView = whichSeatsPickerView
        whichSeatsPickerView.delegate = self
        whichSeatsPickerView.dataSource = self
        //是否携带儿童
        yesOn.inputView = yesOnPickerView
        yesOnPickerView.delegate = self
        yesOnPickerView.dataSource = self
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
        @IBAction func danButton(_ sender: UIButton) {  //单程按键
        danButton.backgroundColor = .blue
        wanfangButton.backgroundColor = .white
        duoChengButton.backgroundColor = .white
        time2.isHidden = true
    }
    @IBAction func wangFanButton(_ sender: UIButton) { //往返按键
        danButton.backgroundColor = .white
        wanfangButton.backgroundColor = .blue
        duoChengButton.backgroundColor = .white
        time2.isHidden = false
        
    }
    @IBAction func duoButton(_ sender: UIButton) {//多程按键
        danButton.backgroundColor = .white
        wanfangButton.backgroundColor = .white
        duoChengButton.backgroundColor = .blue
        time2.isHidden = false
    }
    @IBAction func chirdenButton(_ sender: UIButton) {//是否携带儿童按键
    }
    
    
    @IBAction func seatChanged(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8, animations:{
            
                let keepCountry = self.country1.frame
                let keepCountry1 = self.country2.frame
                self.country2.frame = keepCountry
                self.country1.frame = keepCountry1
        })
    }
    
}
extension FirstTableViewCell: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case inputCountry1PickerView:
            return 1
        case inputCountry2PickerView:
            return 1
        case time1PickerView:
            return 3
        case time2PickerView:
            return 3
        case whichSeatsPickerView:
            return 1
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case inputCountry1PickerView:
            return country.count
        case inputCountry2PickerView:
            return country.count
        case time1PickerView:
            if component == 0 {
                return yearArray.count
            } else if component == 1{
                return monthArray.count
            } else {
                return num
            }
        case time2PickerView:
            if component == 0 {
                return yearArray.count
            } else if component == 1{
                return monthArray.count
            } else {
                return num1
            }
        case whichSeatsPickerView:
            return seat.count
        default:
            return child.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case inputCountry1PickerView:
            return country[row]
        case inputCountry2PickerView:
            return country[row]
        case time1PickerView:
            if component == 0 {
                return yearArray[row]
            } else if component == 1{
                return monthArray[row]
            } else {
                return dayArray[row]
            }
        case time2PickerView:
            if component == 0 {
                return yearArray[row]
            } else if component == 1 {
                return monthArray[row]
            } else {
                return dayArray[row]
            }
        case whichSeatsPickerView:
            return seat[row]
        default:
            return child[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case inputCountry1PickerView:
            country1.text = country[row]
        case inputCountry2PickerView:
            country2.text = country[row]
        case time1PickerView:
            if component == 0 {
                yearnum = row
            } else if component == 1 {
                monthnum = row
                switch monthArray[monthnum] {
                case "1月","3月","5月","7月","8月","10月","12月":
                    num = 31
                case "2月":
                    num = 28
                default:
                    num = 30
                }
            } else {
                daynum = row
            }
                
         pickerView.reloadComponent(2)
         time1.text = "\(yearArray[yearnum])年\(monthArray[monthnum])\(dayArray[daynum])"
           
         case time2PickerView:
            if component == 0 {
                yearnum1 = row
            } else if component == 1 {
                monthnum1 = row
                switch monthArray[monthnum1] {
                case "1月","3月","5月","7月","8月","10月","12月":
                    num1 = 31
                case "2月":
                    num1 = 28
                default:
                    num1 = 30
                }
            } else {
                daynum1 = row
            }
            pickerView.reloadComponent(2)
             time2.text = "\(yearArray[yearnum1])年\(monthArray[monthnum1])\(dayArray[daynum1])"
        case whichSeatsPickerView:
            whichSeats.text = seat[row]
        default:
            yesOn.text = child[row]
        }
        
       
    }
    
    
}
