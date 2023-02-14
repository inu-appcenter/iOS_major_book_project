//
//  BookInfoVC.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/11.
//

import UIKit
import Then
import SnapKit
import SwiftUI

class BookInfoVC: UIViewController {
    
    
    lazy var infoView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.appColor(.point).cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 5
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = "한혜진"
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)

    }
    
    lazy var bookNameLabel = UILabel().then {
        $0.text = "융합디자인론"
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }
    
    lazy var majorLabel = UILabel().then {
        $0.text = "전공선택 디자인학부"
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        
    }
    
    lazy var label1 = UILabel().then {
        $0.text = "주교재 및 참고서적"
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    lazy var button1 = UIButton().then {
        $0.setTitle("참고서적", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        
    }
    lazy var button2 = UIButton().then {
        $0.setTitle("주교재", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
    }
    
    lazy var bookView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControl()
        setupLayouts()
        setupConstraints()
    }
    
    
    private func navigationControl() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "융합디자인론/한혜진"
    }
    
    private func setupLayouts() {
        [
        infoView,
        nameLabel,
        bookNameLabel,
        majorLabel,
        label1,
        button1,
        button2,
        bookView
        ].forEach{self.view.addSubview($0)}
        
    }
    
    
    private func setupConstraints() {
        
        infoView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(92)
        }
        
        nameLabel.snp.makeConstraints {make in
            make.left.equalTo(infoView.snp.left).offset(16)
            make.top.equalTo(infoView.snp.top).offset(18)
        }
        
        bookNameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            
        }
        
        majorLabel.snp.makeConstraints{ make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(32)
        }
        
        label1.snp.makeConstraints { make in
            make.leading.equalTo(infoView)
            make.top.equalTo(infoView.snp.bottom).offset(30)
            
        }
        
        button1.snp.makeConstraints {make in
            make.trailing.equalTo(infoView)
            make.top.equalTo(infoView.snp.bottom).offset(26)
        }
        
        button2.snp.makeConstraints { make in
            make.trailing.equalTo(button1.snp.leading).offset(-8)
            make.top.equalTo(infoView.snp.bottom).offset(26)
            
        }
        
        bookView.snp.makeConstraints {make in
            make.leading.equalTo(label1)
            make.trailing.equalTo(button1)
            make.top.equalTo(label1.snp.bottom).offset(12)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
     
        
        
        
    }
}




#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct BookInfoViewPreview: PreviewProvider {
  static var previews: some View {
      BookInfoVC().toPreview()
  }
}
    #endif

