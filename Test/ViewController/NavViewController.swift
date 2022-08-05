//
//  NavViewController.swift
//  Test
//
//  Created by 구태훈 on 2022/08/01.
//

import UIKit
import Alamofire // 통신 라이브러리

class NavViewController: UIViewController {
    

//    String url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON";
//
//            MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
//            params.add("authkey", "82KIO0FjdMaJHfza02btosjpyvzvYNOz");
//            params.add("searchdate", today);
//            params.add("data", "AP01");
//
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var param:[ApiResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        print("하하하:", self.param)
//        self.param = "우하하하ㅏ"
//        self.test.text = param
        let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON"
        var params:[String:String] = [:]
        params["authkey"] = "82KIO0FjdMaJHfza02btosjpyvzvYNOz"
        params["searchdate"] = "20220701"
        params["data"] = "AP01"
        
        // 서브 쓰레드로 도는 데 global
        DispatchQueue.global().async {
            AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: [ApiResponse].self) {
                response in
                if let error = response.error {
                    
                    print("에라다", error)
                }
                
                if var value = response.value {
//                    print("정상:", value)
                    self.param = value
                    
//                    print("하하하;::", self.param )
                    
                }
                    
            }
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async { // 메인쓰레드
            self.tableView.reloadData() // 화면 갱신은 메인 쓰레드
        }
    }
    
    @IBAction func fffff(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// 확장
extension NavViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // 각 셀의 높이 -- 데이터 수만큼
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}

extension NavViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for:indexPath) as? TableViewCell3 else {
            return UITableViewCell()
        }
        cell.setVal(apiResponse: self.param[indexPath.row] )
        return cell
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("여긴어떰::", self.param)
////        let dic = self.param[indexPath.row]
////        let type = dic["type"]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for:indexPath) as! TableViewCell3
//        cell.setVal(dic: self.param[indexPath.row])
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.param.count
    }
    
    
    
}


struct ApiResponse: Codable {
    var cur_unit : String?
    var cur_nm : String?
    var curUnit : String?
    var curNm : String?
    
    private enum CodingKeys: String, CodingKey {
        case cur_unit, cur_nm
    }
    
    init(from decoder: Decoder) throws {
        let temp = try decoder.container(keyedBy: CodingKeys.self)
        print("이게머지:", temp)
        curNm = (try? temp.decode(String.self, forKey: .cur_nm)) ?? ""
        curUnit = (try? temp.decode(String.self, forKey: .cur_unit)) ?? ""
    }
//
//    init(cur_unit:String?, cur_nm:String?) {
//        self.curUnit = cur_unit
//        self.curNm = cur_nm
//
//    }
    
//    mutating func setVal(input:[[:]]){
//        self.curUnit = inputcur_unit
//        self.curNm = cur_nm
//    }
//
//    init(cur_unit: String, cur_nm: String ) {
//        self.curUnit = cur_unit
//        self.curNm = cur_nm
//
//    }
    
//    let bkpr : String?
}

