

import UIKit
import SwiftUI
import SnapKit
import Then


class LoginVC: UIViewController {
    
    //MARK: - Component
    
    private let contentView = UIView()
    
    lazy var searchingIdPw = UIButton().then {
        $0.setTitle("아이디/비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Light", size: 12)
    }
    
    lazy var autoLoginBtn = UIButton().then {
        $0.setTitle("   자동 로그인", for: .normal)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.setImage(UIImage(named: "box"), for: .normal)
        $0.setImage(UIImage(named: "checkBox"),for: .selected)
        $0.addTarget(self, action: #selector (checkBoxButton(_:)), for: .touchUpInside)
    }
    
    private let imageView: UIImageView = {
        let imageV =  UIImageView()
        imageV.backgroundColor = .white
        imageV.image = UIImage(named: "휘장 3")
        return imageV
    }()
    
    private let idField: UITextField = {
        let id = UITextField()
        id.backgroundColor = #colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)
        id.attributedPlaceholder = NSAttributedString(string: "   아이디", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4834214449, green: 0.4834213853, blue: 0.4834214449, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14,weight: .regular)])
        id.layer.cornerRadius = 5
        return id
    }()
    
    private let pwField: UITextField = {
        let pw = UITextField()
        pw.backgroundColor = #colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)
        pw.attributedPlaceholder = NSAttributedString(string: "   패스워드", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)])
        pw.layer.cornerRadius = 5
        return pw
        
    }()
    
    lazy var loginBtn = UIButton().then {
        $0.backgroundColor = UIColor.appColor(.point)
        $0.layer.cornerRadius = 5
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(pushLoginButton), for: .touchUpInside)
    }
    
    lazy var joinBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("학번으로 회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretend-Regular", size: 14)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.appColor(.gray4).cgColor
        $0.addTarget(self, action: #selector(pushJoinButton), for: .touchUpInside)
    }
    
    lazy var notLoginBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("비회원 사용", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretend-Regular", size: 14)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.appColor(.gray4).cgColor
        $0.addTarget(self, action: #selector(pushNotLoginButton), for: .touchUpInside)
    }

    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        

        
    }
    
    //MARK: - Layout
    
    private func setupLayout() {
        self.view.addSubview(contentView)
        [
            autoLoginBtn,
            searchingIdPw,
            imageView,
            idField,
            pwField,
            loginBtn,
            joinBtn,
            notLoginBtn
        ].forEach {contentView.addSubview($0)}
        setupConstraint()
    }
    
    
    //MARK: - Constraint
    
    private func setupConstraint() {
        
        self.view.backgroundColor = .white
        
        contentView.snp.makeConstraints{ make in
            make.trailing.leading.bottom.top.equalToSuperview().offset(0)
            
        }
        
        
        imageView.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(idField.snp.top).offset(-45)
            
        }
    
        idField.snp.makeConstraints{make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(pwField.snp.top).offset(-15)
        }
        
        pwField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(autoLoginBtn.snp.top).offset(-12)
            
        }
        
        loginBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(joinBtn.snp.top).offset(-8)
            make.height.equalTo(50)
        }
        
        autoLoginBtn.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(loginBtn.snp.top).offset(-117)
            
        }
        
        searchingIdPw.snp.makeConstraints {make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(autoLoginBtn)
        }
        
        joinBtn.snp.makeConstraints { make in
            make.leading.equalTo(loginBtn.snp.leading)
            make.trailing.equalTo(loginBtn.snp.centerX).offset(-4)
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(46)
            
        }
        
        notLoginBtn.snp.makeConstraints { make in
            make.leading.equalTo(loginBtn.snp.centerX).offset(4)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(joinBtn)
            make.height.equalTo(joinBtn)
            
        }
        
        
    }
    //MARK: - objc
    
    @objc func pushLoginButton(sender: UIButton!) {
        print("버튼 selected")
        let mainViewController = MainVC()
        view.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        view.window?.rootViewController?.dismiss(animated: true)
    
    }
    
    @objc func checkBoxButton(_ sender: UIButton) {
        print("check")
        sender.isSelected = !sender.isSelected
        
    }
    
    @objc func pushJoinButton(sender: UIButton) {
        print("학번으로 회원가입 버튼 Pushed")
        let joinVC = JoinVC()
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
    
    @objc func pushNotLoginButton(sender: UIButton) {
        print("비회원으로 사용하기 pushed")
        let notLoginVC = NotLoginVC()
        view.window?.rootViewController = UINavigationController(rootViewController: notLoginVC)
        view.window?.rootViewController?.dismiss(animated: true)
    
        
    }
}
    
#if canImport(SwiftUI) && DEBUG
struct ViewControllerPreView: PreviewProvider {
  static var previews: some View {
    LoginVC().toPreview()
  }
}
    
#endif


