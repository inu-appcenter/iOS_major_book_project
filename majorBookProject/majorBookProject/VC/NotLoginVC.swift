import Foundation
import Then
import DropDown
import UIKit

class NotLoginVC: UIViewController {
    

    
    //MARK: - Component
    
    var selected: String = "과목명"
    var searchText: String = "SearchBar Text"
    
    lazy var searchBtn = UIButton().then {
        $0.setTitle("로그인하고 더 많은 기능 사용하기", for: .normal)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        $0.setImage(UIImage(named: "right"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 12)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.addTarget(self, action: #selector(didTapLoginButton(_:)), for: .touchUpInside)
    }
    
    lazy var memberView = UIView().then{
        $0.backgroundColor = UIColor.appColor(.iris)
        $0.layer.cornerRadius = 5
    }
    
    
    lazy var nameLabel = UILabel().then{
        
        $0.text = "전공책 정보?\n00에서 찾아보자"
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.textColor = .white
    }
    
    lazy var majorLabel = UILabel().then{
        $0.text = "내가 듣는 수업의 전공책 정보를 쉽고 빠르게"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .white
    }
    
    lazy var searchBar = UISearchBar().then{
        $0.placeholder = "검색어를 입력하세요"
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "icon"), for: .normal)
        
        $0.searchBarStyle = .minimal
        $0.searchTextField.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.searchTextField.textColor = UIColor.appColor(.gray4)
        
    }
    
    
    private let tableView: UITableView = {
        let tV =  UITableView(frame: .zero, style: .plain)
        tV.layer.cornerRadius = 5
        tV.layer.borderColor = UIColor.appColor(.gray3).cgColor
        tV.layer.borderWidth = 1
        tV.backgroundColor = .white
        tV.register(mainTableViewCell.self, forCellReuseIdentifier: mainTableViewCell.identifier)
        tV.separatorColor = UIColor.appColor(.gray3)
        tV.separatorInset.left = 0
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
        attribute()
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
    
    @objc func didTapGear(_ sender: UIButton) {
        print("pushed gearBtn")
        navigationControl()
        let preferVC =  PreferencesVC()
        self.navigationController?.pushViewController(preferVC, animated: true)
    }
    
    @objc func didTapBookMark(_ sender: UIButton) {
        print("pushed bookmarkBtn")
        navigationControl()
        let bookmarkVC = SavingBookMarkVC()
        self.navigationController?.pushViewController(bookmarkVC, animated: true)
    }
    
    @objc func didTapLoginButton(_ sender: UIButton) {
        let LoginVC = LoginVC()
        view.window?.rootViewController = UINavigationController(rootViewController: LoginVC)
        view.window?.rootViewController?.dismiss(animated: true)
    }
    //MARK: - Func
    
    private func attribute(){
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func navigationControl() {
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
            backBarButtonItem.tintColor = .black
            self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func attText(search:String) -> AttributedString {
        var attText = AttributedString.init(search)
        attText.font = UIFont(name: "Pretendard-Regular", size: 14)
        attText.foregroundColor = UIColor.appColor(.gray4)
        
        
        return attText
    }
    
    private func isDropDown(isDrop: Bool) {
        
        if isDrop == true {
            searchMenu.layer.borderColor = UIColor.appColor(.point).cgColor
        }else {
    searchMenu.layer.borderColor = UIColor.appColor(.gray3).cgColor
            searchMenu.isSelected = false
        }
        
    }
    
    private func configureDropDown() {

        searchMenuDropDown.dataSource = ["교수명","학과명","과목명"]
        searchMenuDropDown.anchorView = self.searchMenu
        searchMenuDropDown.backgroundColor = .white
        searchMenuDropDown.selectionBackgroundColor = UIColor.appColor(.gray1)
        searchMenuDropDown.direction = .bottom
        searchMenuDropDown.bottomOffset = CGPoint(x: 0, y:(searchMenuDropDown.anchorView?.plainView.bounds.height)! + 40)

        searchMenuDropDown.shadowColor = .white
        searchMenuDropDown.textFont = UIFont(name: "Pretendard-Regular", size: 14)!
        searchMenuDropDown.textColor =  UIColor.appColor(.gray4)
        searchMenuDropDown.selectedTextColor = UIColor.appColor(.gray4)
        searchMenuDropDown.layer.borderWidth = 1
        searchMenuDropDown.cornerRadius = 5
        searchMenuDropDown.cellHeight = 36
        searchMenuDropDown.borderWidth = 1
        searchMenuDropDown.borderColor = UIColor.appColor(.gray3).cgColor
        
        searchMenuDropDown.selectionAction = { index, item in
            
            self.selected = item
            self.searchMenu.configuration?.attributedTitle = self.attText(search: item)
            self.isDropDown(isDrop: false)
            
            self.searchMenuDropDown.clearSelection()
            print(self.selected)
        }
        
        searchMenuDropDown.cancelAction = {
            self.isDropDown(isDrop: false)
            self.searchMenu.isSelected = false
            }
    }
    
    private func initRequestModel(item: String, text: String) -> postSubject {
        switch (item){
        case "학과명":
            return postSubject(department: text, name: "", professor: "")
        case "과목명":
            return postSubject(department: "", name: text, professor: "")
        case "교수명":
            return postSubject(department: "", name: "", professor: text)
        default:
            return postSubject(department: "", name: text, professor: "")
        }
    } 
    
    
    //MARK: - Layout
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        [
            memberView,
            searchBtn,
            nameLabel,
            majorLabel,
            searchBar,
            searchMenu,
            searchMenuDropDown,
            tableView
        ].forEach {self.view.addSubview($0)}
        
    }
    
    private func setupConstraint() {
      
        
        memberView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(71)
            make.height.equalTo(160)
            
        }
        
        searchBtn.snp.makeConstraints {make in
            make.trailing.equalTo(memberView.snp.trailing).offset(-16)
            make.bottom.equalTo(memberView.snp.bottom).offset(-18)
            make.height.equalTo(24)
            make.width.equalTo(182)
            
        }
        
       
        nameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(memberView.snp.leading).offset(16)
            make.top.equalTo(memberView.snp.top).offset(24)
            make.height.equalTo(48)
     
            
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
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-91)
        }
        
        
    }
    
    
    
}

extension NotLoginVC: UISearchBarDelegate {
    
    // 서치바 키보드 내리기
    private func dismissKeyboard() {
        print("키보드 내려감")
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        dismissKeyboard()
        searchText = searchBar.text ?? ""
        
        let model = initRequestModel(item: selected, text: searchText)
        //여기서 모델 만들어서 밑에서 보내주
        
        requestPost(data: model) {
            print(model)
        }
        
        print(searchText)
    }
        
    // 서치바 검색이 끝났을 때 호출
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.tableView.reloadData()
    }

    
}




extension NotLoginVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCell.identifier, for: indexPath) as? mainTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
        default:
            let bookInfoVC = BookInfoVC()
            self.navigationController?.pushViewController(bookInfoVC, animated: true)
            navigationControl()
        }
        
        
    }
    
}





#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct NotLoginViewControllerPreView: PreviewProvider {
  static var previews: some View {
    NotLoginVC().toPreview()
  }
}
    #endif


