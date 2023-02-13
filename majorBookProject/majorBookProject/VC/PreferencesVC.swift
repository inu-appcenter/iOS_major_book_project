//
//  Preferences.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/13.
//

import UIKit
import SnapKit
import Then

class PreferencesVC: UIViewController {
    
    let preferList = ["개인정보관리","차단사용자관리","언어설정","오픈소스라이센스","개인정보 처리방침","버전정보 1.00 (128)","로그아웃"]
    
    private let tableView: UITableView = {
        let tV =  UITableView(frame: .zero, style: .plain)
        tV.layer.cornerRadius = 5
        tV.layer.borderColor = UIColor.appColor(.gray3).cgColor
        tV.layer.borderWidth = 1
        tV.backgroundColor = .white
        tV.register(preferCell.self, forCellReuseIdentifier: preferCell.identifier)
        tV.separatorColor = UIColor.appColor(.gray3)
        tV.separatorInset.left = 0
        tV.rowHeight = 51
        return tV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupConstraints()
        attribute()
    }
    
    private func attribute() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func setupLayouts(){
        [
            tableView
        
        ].forEach({self.view.addSubview($0)})
        
    }
    
    private func setupConstraints(){
        
        tableView.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalToSuperview()
            
        }
        
    }
    
}


extension PreferencesVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: preferCell.identifier, for: indexPath) as! preferCell
        
        cell.preferText.text = preferList[indexPath.row]
        cell.preferText.textColor = .black
        cell.preferText.font = UIFont(name: "Pretendard-Light", size: 15)
        
        return cell
    }
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PreferencesViewPreview: PreviewProvider {
  static var previews: some View {
      PreferencesVC().toPreview()
  }
}
    #endif
