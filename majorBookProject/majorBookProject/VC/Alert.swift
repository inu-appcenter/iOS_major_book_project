//
//  Alert.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/03/18.
//

import UIKit
import Then
import SnapKit

protocol CustomAlertDelegate {
    func action()   // confirm button event
    func exit()     // cancel button event
}

enum AlertType {
    case onlyConfirm    // 확인 버튼
    case canCancel      // 확인 + 취소 버튼
}

class Alert: UIViewController {
    
    let identifier = "alertVC"
    var delegate: CustomAlertDelegate?
    
    lazy var alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.appColor(.gray1).cgColor
    }
    lazy var textLabel = UILabel().then {
        $0.text = alertText
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        
    }
    lazy var textLabel2 = UILabel().then {
        $0.text = alertText2
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name:"Pretendard-Regular", size: 14)
    }
    
    lazy var cancelButton = UIButton().then {
        $0.backgroundColor = .appColor(.iris)
        $0.layer.cornerRadius = 5
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)

    }
    lazy var confirmButton = UIButton().then {
        $0.backgroundColor = .appColor(.iris)
        $0.layer.cornerRadius = 5
        $0.setTitle(confirmButtonText, for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.addTarget(self, action: #selector(didTapOkAction), for: .touchUpInside)
    }
    
    
    var alertText = "가입되지 않은 ID거나, 잘못된 패스워드입니다."
    var alertText2 = "아이디와 비밀번호는 인천대학교 포탈과 동일합니다."
    var cancelButtonText = "취소"
    var confirmButtonText = "확인"
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setupLayouts()
        setupConstraints()
        
    }
    
    private func attribute() {
        view.backgroundColor = .clear
    }
    
    private func alertAttribute() {
    
        // alertType에 따른 디자인 처리
        
    }
    
    @objc func didTapOkAction() {
        self.dismiss(animated: true)
    }
    private func setupLayouts(){
        [alertView,
         textLabel,
         textLabel2,
         confirmButton
        ].forEach({self.view.addSubview($0)})
    }
    
    private func setupConstraints(){
        alertView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.width.equalTo(328)
            $0.height.equalTo(130)
        }
        textLabel2.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        textLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(textLabel2.snp.top).offset(-8)
        }
        confirmButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(textLabel2.snp.bottom).offset(16)
            $0.width.equalTo(100)
            $0.height.equalTo(28)
        }
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct AlertViewControllerPreView: PreviewProvider {
  static var previews: some View {
    Alert().toPreview()
  }
}
    #endif

