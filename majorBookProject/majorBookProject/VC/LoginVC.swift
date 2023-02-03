

import UIKit
import SwiftUI
import SnapKit


class LoginViewController: UIViewController {
    
    private let contentView = UIView()
    
    private let stackView: UIStackView = {
        let idSaving = UIButton()
        idSaving.backgroundColor = .white
        idSaving.setTitle("아이디저장", for: .normal)
        idSaving.setTitleColor(.gray, for: .normal)
        idSaving.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        let autoLogin = UIButton()
        autoLogin.backgroundColor = .white
        autoLogin.setTitle("자동로그인", for: .normal)
        autoLogin.setTitleColor(.gray, for: .normal)
        autoLogin.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        let notLogin = UIButton()
         notLogin.backgroundColor = .white
         notLogin.setTitle("비회원사용", for: .normal)
         notLogin.setTitleColor(.gray, for: .normal)
         notLogin.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        let stackV = UIStackView(arrangedSubviews: [idSaving,autoLogin,notLogin])
        
        stackV.axis = .horizontal
        stackV.alignment = .fill
        stackV.distribution = .equalSpacing
        stackV.spacing = 3
        
        return stackV
    }()
    
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
            imageView,
            idField,
            pwField,
            stackView,
            loginBtn,
        ].forEach {contentView.addSubview($0)}
        setupConstraint()
    }
    
    
    
    private func setupConstraint() {
        
        self.view.backgroundColor = .white
        
        contentView.snp.makeConstraints{ make in
            make.trailing.leading.bottom.top.equalToSuperview().offset(0)
            
        }
        
        stackView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(47)
            make.trailing.equalToSuperview().offset(-47)
            make.bottom.equalTo(loginBtn.snp.top).offset(-95)
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
            make.bottom.equalTo(stackView.snp.top).offset(-33)
        }
        
        loginBtn.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-33)
            make.height.equalTo(50)
        }
    }
    
    @objc func pushLoginButton(sender: UIButton!) {
        if loginBtn.isSelected == true {
            print("버튼 selected")
            let mainViewController = MainViewController()
            self.navigationController?.pushViewController(mainViewController, animated: true)
            
        }
    
    }
}
    
#if canImport(SwiftUI) && DEBUG
struct ViewControllerPreView: PreviewProvider {
  static var previews: some View {
    LoginViewController().toPreview()
  }
}
    
#endif


