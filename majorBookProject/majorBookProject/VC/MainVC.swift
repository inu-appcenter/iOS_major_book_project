import Foundation
import Then
import UIKit

class MainViewController: UIViewController {
    
    
    lazy var memberView = UIView().then{
        $0.backgroundColor = UIColor(named:"mainColor")
        $0.layer.cornerRadius = 5
    }
    
    lazy var nameLabel = UILabel().then{
        $0.text = "홍길동"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    lazy var majorLabel = UILabel().then{
        $0.text = "정보기술대학 컴퓨터공학부"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
        
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        [
            memberView,
            nameLabel,
            majorLabel
        ].forEach {self.view.addSubview($0)}
        setupConstraint()
        
    }
    
    private func setupConstraint() {
        
        memberView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(24)
            make.height.equalTo(99)
        }
        nameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(memberView.snp.leading).offset(14)
            make.top.equalTo(memberView.snp.top).offset(29)
        }
        majorLabel.snp.makeConstraints{ make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(7)
            
        }
        
    }
    
    
    
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct MainViewControllerPreView: PreviewProvider {
  static var previews: some View {
    MainViewController().toPreview()
  }
}
    #endif


