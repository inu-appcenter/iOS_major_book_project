import Foundation
import Then
import DropDown
import UIKit

class MainVC: UIViewController, UICollectionViewDelegate {
    
    
    //MARK: - Component
    
    lazy var memberView = UIView().then{
        $0.backgroundColor = UIColor(named:"mainColor")
        $0.layer.cornerRadius = 5
        
    }
    
    lazy var dropBtn = UIButton()
    
    lazy var dropView = UIView().then{
        $0.isHidden = true
        $0.backgroundColor = .clear
        $0.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        $0.layer.borderWidth = 1
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
    
    let testArr = ["a","b","c","d"]
    private let tableView: UITableView = {
        let tV =  UITableView(frame: .zero, style: .grouped)
        tV.layer.cornerRadius = 5
        tV.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        tV.layer.borderWidth = 1
        tV.backgroundColor = .white
        tV.register(mainTableViewCell.self, forCellReuseIdentifier: mainTableViewCell.identifier)
        tV.rowHeight = UITableView.automaticDimension
        return tV
    }()
    
    
    
    let searchMenuDropDown = DropDown()
    
    
    
    lazy var searchMenu : UIButton = {
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets.init(top: 11, leading: 0, bottom: 11,trailing: 0)
        configuration.attributedTitle = attText(search: "교수명")
        configuration.baseBackgroundColor = .white
        
        let btn = UIButton(configuration: configuration)
        btn.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        
        btn.semanticContentAttribute = .forceRightToLeft
        btn.setImage(UIImage(named: "chevron-down"), for: .normal)
        btn.setImage(UIImage(named: "chevron-up"), for: .selected)

        btn.addTarget(self, action: #selector(didTapSearchMenu(_:)), for: .touchUpInside)

        return btn
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupLayout()
        setupConstraint()
        configureDropDown()
       
    }
    
    //MARK: - @objc
    
    @objc func didTapSearchMenu(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isDropDown(isDrop: sender.isSelected)
        
        searchMenuDropDown.show()
    }
    
    
    //MARK: - Func
    
    private func attText(search:String) -> AttributedString {
        var attText = AttributedString.init(search)
        
//        var paragraphStyle = NSMutableParagraphStyle()
//
//        paragraphStyle.lineHeightMultiple = 0.83
//
//
//
//        view.attributedText = NSMutableAttributedString(string: "교수명", attributes: [NSAttributedString.Key.kern: -0.3, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        attText.font = UIFont(name: "Pretendard-Regular", size: 14)
        attText.foregroundColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        
        
        return attText
    }
    
    private func isDropDown(isDrop: Bool) {
        
        if isDrop == true {
            searchMenu.layer.borderColor = UIColor(red: 0.365, green: 0.373, blue: 0.937, alpha: 1).cgColor
            dropView.isHidden = false
        }else {
            searchMenu.layer.borderColor = UIColor(red: 0.683, green: 0.683, blue: 0.683, alpha: 1).cgColor
            searchMenu.isSelected = false
            dropView.isHidden = true
        }
        
    }
    
    private func configureDropDown() {

        searchMenuDropDown.dataSource = ["교수명","학과명","과목명"]
        searchMenuDropDown.anchorView = self.dropBtn
        searchMenuDropDown.backgroundColor = .white
        searchMenuDropDown.selectionBackgroundColor = UIColor(red: 0.963, green: 0.963, blue: 0.963, alpha: 1)
        searchMenuDropDown.direction = .bottom
        searchMenuDropDown.bottomOffset = CGPoint(x: 0, y:(searchMenuDropDown.anchorView?.plainView.bounds.height)! + 50)

        searchMenuDropDown.shadowColor = .white
        searchMenuDropDown.textFont = UIFont(name: "Pretendard-Regular", size: 14)!
        searchMenuDropDown.textColor =  UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        searchMenuDropDown.selectedTextColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        searchMenuDropDown.layer.borderWidth = 2
        searchMenuDropDown.cornerRadius = 5
        searchMenuDropDown.cellHeight = 36
        
        searchMenuDropDown.selectionAction = { index, item in
            print(item)
            self.searchMenu.configuration?.attributedTitle = self.attText(search: item)
            self.isDropDown(isDrop: false)
            
            self.searchMenuDropDown.clearSelection()
        }
        
        searchMenuDropDown.cancelAction = { [weak searchMenu] in
            self.isDropDown(isDrop: false)
            self.searchMenu.isSelected = false
            }
    }
    
    //MARK: - Layout
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        [
            dropBtn,
            memberView,
            nameLabel,
            majorLabel,
            searchBar,
            searchMenu,
            searchMenuDropDown,
            tableView,
            dropView
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
        
        searchMenu.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalTo(searchBar.snp.centerY)
            make.trailing.equalTo(searchBar.snp.leading).offset(-8)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-71)
        }
        dropView.snp.makeConstraints { make in
            make.top.equalTo(searchMenu.snp.bottom).offset(4)
            make.leading.trailing.equalTo(searchMenu)
            make.height.equalTo(115)
            
        }
        dropBtn.snp.makeConstraints {make in
            make.top.bottom.equalTo(searchMenu)
            make.leading.trailing.equalTo(searchMenu).inset(1)
        }
        
        
    }
    
    
    
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCell.identifier, for: indexPath) as? UITableViewCell else { return UITableViewCell() }
        
//        cell.textLabel?.text = testArr[indexPath.row]
        
        return cell
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


