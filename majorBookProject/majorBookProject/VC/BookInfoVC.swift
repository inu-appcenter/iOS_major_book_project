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
        label1
        ].forEach{self.view.addSubview($0)}
        
    }
    
    
    private func setupConstraints() {
        
        infoView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(68)
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
            make.top.equalTo(infoView.snp.bottom).offset(24)
            
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

