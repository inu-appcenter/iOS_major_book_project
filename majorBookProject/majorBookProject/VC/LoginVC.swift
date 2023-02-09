

import UIKit
import SwiftUI
import SnapKit
import Then


class LoginVC: UIViewController {
    
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
    
    lazy var loginBtn: UIButton = {
        let loginbtn = UIButton()
        loginbtn.backgroundColor = UIColor(named: "mainColor")
        loginbtn.layer.cornerRadius = 5
        loginbtn.setTitle("로그인", for: .normal)
        loginbtn.setTitleColor(.white, for: .normal)
        loginbtn.addTarget(self, action: #selector(pushLoginButton), for: .touchUpInside)
    
        return loginbtn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        

        
    }
    
    private func setupLayout() {
        self.view.addSubview(contentView)
        [
            autoLoginBtn,
            searchingIdPw,
            imageView,
            idField,
            pwField,
            loginBtn,
        ].forEach {contentView.addSubview($0)}
        setupConstraint()
    }
    
    
    
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
            make.bottom.equalToSuperview().offset(-94)
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
    }
    
    @objc func pushLoginButton(sender: UIButton!) {
        print("버튼 selected")
        let mainViewController = MainVC()
        view.window?.rootViewController = mainViewController
        view.window?.rootViewController?.dismiss(animated: true)
    
    }
    
    @objc func checkBoxButton(_ sender: UIButton) {
        print("check")
        sender.isSelected = !sender.isSelected
        
    }
}
    
#if canImport(SwiftUI) && DEBUG
struct ViewControllerPreView: PreviewProvider {
  static var previews: some View {
    LoginVC().toPreview()
  }
}
    
#endif


