//
//  JoinVC.swift
//  majorBookProject
//
//  Created by 한지훈 on 2023/02/04.
//

import UIKit
import SwiftUI
import SnapKit
import DropDown

class JoinVC: UIViewController {
    let collegeList = ["인문대학", "자연과학대학", "사회과학대학", "글로벌정경대학", "공과대학", "정보기술대학",
                   "경영대학", "예술체육대학", "사범대학", "도시과학대학", "생명과학대학", "동북아국제통상학부", "법학부"]
    
    var major = ""
    
    lazy var nameLabel: UILabel = {
        let label = createLabel("이름")
        
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = createTextField("이름을 입력하세요")
        
        return tf
    }()
    
    
    lazy var majorLabel: UILabel = {
        let label = createLabel("학과")
        
        return label
    }()
    
    lazy var collegeButton : UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 105)

        var attText = AttributedString.init("단과대")

//        attText.font = UIFont(name: "Pretendard-Light", size: 16)
            attText.foregroundColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        configuration.attributedTitle = attText

        let btn = UIButton(configuration: configuration)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        btn.layer.cornerRadius = 5

        btn.addTarget(self, action: #selector(didTapCollegeButton(_:)), for: .touchUpInside)

        return btn
        
    }()
    
    lazy var majorButton: UIButton = {
        let btn = createButton("학과")
        btn.layer.borderWidth = 1
        
        btn.titleLabel?.font = UIFont(name: "Pretendard-Light", size: 16)
        btn.setTitleColor(UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1), for: .normal)
        btn.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        
        btn.addTarget(self, action: #selector(didTapMajorButton(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var idLabel: UILabel = {
       let label = createLabel("아이디(학번)")
        
        return label
    }()
    
    lazy var idTextField: UITextField = {
       let tf = createTextField("인천대학교 포탈 아이디를 입력하세요")
        
        return tf
    }()
    
    lazy var passwdLabel: UILabel = {
       let label = createLabel("비밀번호를 입력하세요")
        
        return label
    }()
    
    lazy var passwdTextField: UITextField = {
       let tf = createTextField("인천대학교 포탈 비밀번호를 입력하세요")
        
        return tf
    }()
    
    lazy var confirmButton: UIButton = {
        let btn = createButton("재학생 인증")
        
        btn.layer.backgroundColor = UIColor(red: 0.471, green: 0.475, blue: 0.945, alpha: 1).cgColor
        btn.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return btn
    }()
    
    lazy var infoLabel: UILabel = {
        let label = createLabel("회원가입시 수집한 개인정보는 재학생 인증에만 사용됩니다.")
        label.font = UIFont(name: "Pretendard-Light", size: 12)
        label.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        
        return label
    }()
    
    lazy var joinDoneButton: UIButton = {
        let btn = createButton("가입완료")
        btn.layer.backgroundColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        btn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        btn.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        btn.addTarget(self, action: #selector(didTapJoinButton(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    let collegeDropDown = DropDown()
    
    @objc func didTapCollegeButton(_ sender: UIButton) {
        self.collegeButton.layer.cornerRadius = 5
        self.collegeButton.layer.borderWidth = 1
        self.collegeButton.layer.borderColor = UIColor(red: 0.365, green: 0.373, blue: 0.937, alpha: 1).cgColor
        collegeDropDown.show()
    }
    
    @objc func didTapMajorButton(_ sender: UIButton) {
        self.majorButton.layer.cornerRadius = 5
        self.majorButton.layer.borderWidth = 1
        self.majorButton.layer.borderColor = UIColor(red: 0.365, green: 0.373, blue: 0.937, alpha: 1).cgColor
        
        collegeDropDown.show()
    }
    
    @objc func didTapJoinButton(_ sender: UIButton) {
        let joinVC = JoinDoneVC()
        view.window?.rootViewController = joinVC
        view.window?.rootViewController?.dismiss(animated: true)
    }
    
    private func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        return label
    }
    
    private func createButton(_ text: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(text, for: .normal)
        btn.layer.cornerRadius = 5
        
        return btn
    }
    
    private func createTextField(_ text: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = text
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        tf.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        tf.font = UIFont(name: "Pretendard-Light", size: 16)
        tf.addLeftPadding()
        
        return tf
    }
    
    private func createView() -> UIView {
        let view = UIView()
    
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
    
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupLayout()
        setupConstraint()
        configureDropDown()
        
    }
    
    private func configureDropDown() {

        collegeDropDown.dataSource = collegeList
        collegeDropDown.anchorView = self.collegeButton
        collegeDropDown.direction = .bottom
        collegeDropDown.bottomOffset = CGPoint(x: 0, y:(collegeDropDown.anchorView?.plainView.bounds.height)! + 50)
//        collegeDropDown.textFont = UIFont(name: "Pretendard-Light", size: 16)!
        collegeDropDown.textColor =  UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        collegeDropDown.layer.cornerRadius = 5
        collegeDropDown.cellHeight = 46
        collegeDropDown.selectionAction = { index, item in
            print("dd")
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        [
            nameLabel,
            nameTextField,
            majorLabel,
            collegeButton,
            majorButton,
            idLabel,
            idTextField,
            passwdLabel,
            passwdTextField,
            confirmButton,
            infoLabel,
            joinDoneButton
            
        ].forEach {self.view.addSubview($0)}
    }
    
    private func setupConstraint() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(16)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(147)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(328)
            $0.height.equalTo(46)
        }
        
        majorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(209)
            $0.left.equalToSuperview().offset(16)
        }
        
        collegeButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(232)
            $0.height.equalTo(46)
            $0.width.equalTo(161)
        }
        
        majorButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(183)
            $0.top.equalToSuperview().offset(232)
            $0.height.equalTo(46)
            $0.width.equalTo(161)
        }
        
        idLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(295)
        }
        
        idTextField.snp.makeConstraints{
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(328)
            $0.height.equalTo(46)
            $0.top.equalToSuperview().offset(319)
        }
        
        passwdLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(381)
        }
        
        passwdTextField.snp.makeConstraints{
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(328)
            $0.height.equalTo(46)
            $0.top.equalToSuperview().offset(405)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(471)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(137)
            $0.height.equalTo(38)
        }
        
        infoLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(517)
        }
        
        joinDoneButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(328)
            $0.top.equalToSuperview().offset(634)
            $0.height.equalTo(46)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct JoinViewPreview: PreviewProvider {
  static var previews: some View {
    JoinVC().toPreview()
  }
}
    #endif


