import Foundation
import Then
import DropDown
import UIKit

class MainVC: UIViewController {
    
    
    lazy var memberView = UIView().then{
        $0.backgroundColor = UIColor(named:"mainColor")
        $0.layer.cornerRadius = 5
    }
    
    lazy var nameLabel = UILabel().then{
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.83
        $0.attributedText = NSMutableAttributedString(string: "김가온", attributes: [NSAttributedString.Key.kern: -0.4, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        $0.textColor = .white
    }
    
    lazy var majorLabel = UILabel().then{
        $0.text = "정보기술대학 컴퓨터공학부"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .white
    }
    
    lazy var searchBar = UISearchBar().then{
        $0.placeholder = "검색어를 입력하세요"
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "icon"), for: .normal)
        $0.searchBarStyle = .minimal
        $0.searchTextField.font = .systemFont(ofSize: 14)
        
    }
    
    private let collectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemPink
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        [
            memberView,
            nameLabel,
            majorLabel,
            searchBar,
        ].forEach {self.view.addSubview($0)}
        setupConstraint()
        
    }
    
    private func setupConstraint() {
        
        memberView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(71)
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
        searchBar.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(memberView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(112)
        }
    }
    
    
    
}




#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct MainViewControllerPreView: PreviewProvider {
  static var previews: some View {
    MainVC().toPreview()
  }
}
    #endif


