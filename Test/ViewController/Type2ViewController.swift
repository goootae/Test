//
//  Type2ViewController.swift
//  Test
//
//  Created by 구태훈 on 2022/07/28.
//

import Foundation
import UIKit

class Type2ViewController:UIViewController{
    
    @IBOutlet weak var btnClose: UIButton!
    var param:Bool = false
    
    // 뷰컨트롤러가 호출이 되었을때 (1번) 최초 한번
    override func viewDidLoad() {
        // 화면 초기화
        super.viewDidLoad()
        
        self.btnClose.addTarget(self, action: #selector(self.btnCloseEvent) , for: .touchUpInside)
        
        self.btnClose.isHidden = self.param
        
    }
    
    // 사용자한태 보여주기 직전에 호출 (여러번) 보여지는 순간에 수행
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
     
    // 사용자에게 보여줬을때 (여러번)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // 사용자한태 사라지기 직전 (여러번)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // 사용자한태 사라지기고 나서 호출 (여러번)
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @objc func btnCloseEvent(){
        self.dismiss(animated: true)
    }
    
    
    // 1. View1 : viewDidLoad -> viewWillAppear -> viewDidAppear
    // 2. View1 에서 화면 호출 이벤트
    // 3. View1 : viewWillDisappear
    // 4. View2 : viewDidLoad -> viewWillAppear -> viewDidAppear
    // 5. view1 : viewDidDisappear
    // 6. view2 를 종료 했을때 : viewWillDisappear ->v iewDidDisappear
    // 7. view1 : viewWillAppear -> viewDidAppear


}
