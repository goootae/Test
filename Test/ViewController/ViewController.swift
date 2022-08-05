//
//  ViewController.swift
//  Test
//
//  Created by 구태훈 on 2022/07/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    let list = [["value":"a","type":"1"],["value":"b","type":"2"],["value":"c","type":"1"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 셀을 어떻게 로우단위로 -- 데이터 수만큼
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        

        
        if type == "1" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! TableViewCell
            cell.setVal(dic: self.list[indexPath.row])
            return cell
        }
        else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for:indexPath) as! TableViewCell2
            
            cell2.setVal(dic: self.list[indexPath.row])
            return cell2
        }
        
    }
    
    // 이데이터 갯수는 몇개냐 - 한번만 호출
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    // 각 셀의 높이 -- 데이터 수만큼
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        if type == "1" {
            return 100
        }
        else {
            return 200
        }
        
    }
    
    // 로우 선택시 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        if type == "1" {
            let storyboard = UIStoryboard(name: "MainTwo", bundle: nil)
            if let nvc = storyboard.instantiateViewController(withIdentifier: "navViewController") as? UINavigationController {
                let temp = nvc.topViewController as! NavViewController
//                temp.param = list
                nvc.modalPresentationStyle = .fullScreen
                self.present(nvc, animated: true)
            }
           
            
//            let alert = UIAlertController(title: "알림니다.", message: "아부루루바랄랄 \(indexPath.row+1)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "예", style: .destructive, handler: { _ in
//                print("gjkgjgkgkㅏㅎ하ㅏ하")
//            }))
//            alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: { _ in
//                print("아입니다.")
//            }))
//            alert.addAction(UIAlertAction(title: "세번째", style: .default, handler: { _ in
//                print("아입니다.세번째")
//            }))
//            alert.addAction(UIAlertAction(title: "네번째", style: .default, handler: { _ in
//                print("아입니다.네번째")
//            }))
//
//            // 화면 등록
//            present(alert, animated: true) {
//                print("여긴어떻게")
//            }
        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let type2View = storyboard.instantiateViewController(withIdentifier: "type2") as! Type2ViewController
            type2View.modalPresentationStyle = .fullScreen
            type2View.param = true
            self.present(type2View, animated: true)

            
//            guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "type2") as? Type2ViewController else { return }
//                    // 화면 전환 애니메이션 설정
//            secondViewController.modalTransitionStyle = .coverVertical
//                    // 전환된 화면이 보여지는 방법 설정 (fullScreen)
//            secondViewController.modalPresentationStyle = .overFullScreen
//            self.present(secondViewController, animated: true, completion: nil)
        }

        
    }
    
}

