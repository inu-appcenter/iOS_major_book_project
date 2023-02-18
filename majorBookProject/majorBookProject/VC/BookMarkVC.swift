//
//  BookMarkVC.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/13.
//

import UIKit
import SnapKit
import Then

class BookMarkVC: UIViewController {
    
    var answerFilterDatasource =  ExpandingTableViewCellContent() //tableView delegate
    var book = ["책제목","책제목","책제목","책제목"]
    
    private let tableView: UITableView = {
        let tV =  UITableView(frame: .zero, style: .plain)
        tV.contentInset = .zero
        tV.contentInsetAdjustmentBehavior = .never
        tV.layer.cornerRadius = 5
        tV.layer.borderColor = UIColor.appColor(.gray3).cgColor
        tV.layer.borderWidth = 0.5
        tV.backgroundColor = .white
        tV.register(bookmarkCell.self, forCellReuseIdentifier: bookmarkCell.identifier)
        tV.separatorColor = UIColor.appColor(.gray3)
        tV.separatorInset.left = 0
        return tV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupConstraints()
        attribute()
        
    }
    private func attribute() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        self.navigationItem.title = "저장한 교재"
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    private func setupLayouts() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
}


extension BookMarkVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
            let content = answerFilterDatasource
            
            content.expanded = !content.expanded
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: bookmarkCell.identifier, for: indexPath) as! bookmarkCell
        
        cell.settingCell(isClicked: answerFilterDatasource)
        return cell
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct BookMarkViewPreview: PreviewProvider {
  static var previews: some View {
      BookMarkVC().toPreview()
  }
}
    #endif

