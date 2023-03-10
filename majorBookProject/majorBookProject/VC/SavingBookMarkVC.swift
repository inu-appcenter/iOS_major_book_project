//
//  SavingBookMarkVC.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/19.
//

import Foundation
import UIKit
import ExpyTableView


class SavingBookMarkVC: UIViewController {
    
    private let tableView: ExpyTableView = {
        let tV = ExpyTableView()
        tV.layer.cornerRadius = 5
        tV.layer.borderWidth = 1
        tV.layer.borderColor = UIColor.appColor(.gray3).cgColor
        tV.separatorColor = UIColor.appColor(.gray3)
        tV.separatorInset.left = 0
        return tV
    }()
    
    let arraySection0: Array<String> = ["section0_row0","section0_row1","section0_row2"]
    
    let arraySection1: Array<String> = ["section1_row0","section1_row1","section1_row2","section1_row3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAttribute()
        navigationAttribute()
        setupLayouts()
        setupConstraints()
    }
    
    private func navigationAttribute(){
        self.navigationItem.title = "저장한 교재"
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func tableViewAttribute(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupLayouts(){
        self.view.backgroundColor = .white
        [
            tableView,
        
        ].forEach({self.view.addSubview($0)})
        
    }
    
    private func setupConstraints(){
        
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(4)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-273)
            
            
        }
        
    }
}

extension SavingBookMarkVC: ExpyTableViewDelegate, ExpyTableViewDataSource{
    
    //section이 열리고 닫히는 것을 확인
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
                
        switch state {
        case .willExpand:
         print("WILL EXPAND")

        case .willCollapse:
         print("WILL COLLAPSE")

        case .didExpand:
         print("DID EXPAND")

        case .didCollapse:
         print("DID COLLAPSE")
        }
    }
    
    //확장기능 활성화 여부
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    //section내용을 작성(custom한 cell을 적용시켜도됨)
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: expandableCell.identifier) as? expandableCell else{
            return UITableViewCell()
        }
//        cell?.backgroundColor = .white
//        cell?.selectionStyle = .none
        
        if section == 0 {
            
        }
        else{
            
        }
        
        return cell
    }
    
    //row갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //row 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: expandableCell.identifier, for: indexPath) as! expandableCell
        
        if indexPath.section == 0 {
            print("indexPath.section == 0")
        } else {
            print("indexPath.section != 0")
            cell.textLabel?.text = "section-0"
        }
        
        return cell
    }
    
    //section 갯수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //셀을 선택했을 경우 이벤트 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
    }
    
    //셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 84
        }else {
            return 464
        }
    }
    
    
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SavingBookMarkViewPreview: PreviewProvider {
  static var previews: some View {
      SavingBookMarkVC().toPreview()
  }
}
    #endif

