//
//  JoinDoneVC.swift
//  majorBookProject
//
//  Created by 한지훈 on 2023/02/05.
//

import UIKit
import SwiftUI
import SnapKit
import DropDown

class JoinDoneVC: UIViewController {
    
    lazy var fanfareImageView: UIImageView = {
       let iv = UIImageView(image: UIImage(named: "fanfareIcon"))
    
        return iv
    }()
    
    lazy var introduceLabel: UILabel = {
        var label = UILabel()
        label.text = "안녕하세요 김가온님"
        label.frame = CGRect(x: 0, y: 0, width: 129, height: 84)
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
//        label.font = UIFont(name: "Pretendard-Medium", size: 30)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        let fullText = label.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "김가온")
//        attribtuedString.addAttributes([.font: UIFont(name:  "Pretendard-Bold", size: 30) as Any, .foregroundColor: UIColor.black as Any], range: range)
        label.attributedText = attribtuedString
        
        return label
    }()
    
    lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("시작하기", for: .normal)
        btn.layer.backgroundColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        btn.layer.cornerRadius = 5
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        btn.addTarget(self, action: #selector(didTapStartButton(_:)), for: .touchUpInside)
        btn.backgroundColor = UIColor(red: 0.365, green: 0.373, blue: 0.937, alpha: 1)
        
        return btn
    }()
    
    @objc private func didTapStartButton(_ sender: UIButton) {
        let mainVC = MainVC()
        view.window?.rootViewController = mainVC
        view.window?.rootViewController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupConstraint()
        
    }
    
    private func setupLayout() {
        [
            fanfareImageView,
            introduceLabel,
            startButton
        ].forEach {self.view.addSubview($0)}
    }
    
    private func setupConstraint() {
        fanfareImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(200)
            $0.width.height.equalTo(120)
        }
        
        introduceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(364)
            $0.height.equalTo(90)
            $0.width.equalTo(140)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(328)
            $0.height.equalTo(46)
            $0.top.equalTo(634)
        }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct JoinDoneViewPreview: PreviewProvider {
  static var previews: some View {
    JoinDoneVC().toPreview()
  }
}
    #endif
