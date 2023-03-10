//
//  BookInfoVC.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/11.
//

import UIKit
import Then
import SnapKit
import SwiftUI

var model = Book(id: 0, isSaved: false)

class BookInfoVC: UIViewController,SendDataDelegate {
    
    
    //MARK: Delegate func
    
    func recieveData(response: Book, department: String){
        print("전달")
        majorLabel.text = department
        model.publisher = response.publisher!
        model.year = response.year
        model.id = response.id
        model.type = response.type
        model.author = response.author
        model.title = response.title
        nameLabel.text = response.author ?? ""
        bookNameLabel.text = response.title ?? ""
        bookTitle.text = response.title ?? ""
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControl()
        setupLayouts()
        setupConstraints()
    }

    //MARK: Component
    lazy var infoView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.appColor(.point).cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 5
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)

    }
    
    lazy var bookNameLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }
    
    lazy var majorLabel = UILabel().then {
        $0.text = "전공선택 디자인학부"
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        
    }
    
    lazy var label1 = UILabel().then {
        $0.text = "주교재 및 참고서적"
        $0.textColor = UIColor.appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    lazy var button1 = UIButton().then {
        $0.setTitle("참고서적", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
        
    }
    lazy var button2 = UIButton().then {
        $0.setTitle("주교재", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(UIColor.appColor(.gray4), for: .normal)
    }
    
    lazy var bookView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 4
    }
    
    lazy var author = UILabel().then {
        $0.text = "저자"
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    lazy var publisher = UILabel().then {
        $0.text = "출판사"
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    lazy var year = UILabel().then {
        $0.text = "발행년도"
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    lazy var type = UILabel().then {
        $0.text = "자료유형"
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    lazy var url = UILabel().then {
        $0.text = "소장정보"
        $0.textColor = .appColor(.gray4)
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    //MARK: StackViews
    
    lazy var sV3 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5

        
        let content = UILabel()
        content.text = model.author //author
        content.font = UIFont(name: "Pretendard-Regular", size: 14)

        [author,content].forEach({sV.addArrangedSubview($0)})
        
        return sV
    }()
    
    lazy var sV4 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5

        
        let content = UILabel()
        content.text = model.publisher //publisher
        content.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        [publisher,content].forEach({sV.addArrangedSubview($0)})
        
        return sV
    }()
    
    lazy var sV5 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5

       
        
        let content = UILabel()
        content.text = String(model.year ?? 1)  //year
        content.font = UIFont(name: "Pretendard-Regular", size: 14)

        [year,content].forEach({sV.addArrangedSubview($0)})
        
        return sV
    }()
    
    lazy var sV6 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5
       
        
        let content = UILabel()
        content.text = model.type ?? "" //type
        content.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        [type,content].forEach({sV.addArrangedSubview($0)})
        
        return sV
    }()
    
    lazy var sV7 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5

        
        let content = UILabel()
        content.text = "학산도서관 바로가기"
        content.font = UIFont(name: "Pretendard-Regular", size: 14)

        [url,content].forEach({sV.addArrangedSubview($0)})
        
        return sV
    }()
    
    lazy var line1 = createLine()
    lazy var line2 = createLine()
    lazy var line3 = createLine()
    lazy var line4 = createLine()
    lazy var line5 = createLine()
    lazy var line6 = createLine()

    lazy var labell = UILabel().then {
        $0.text = " "
    }
    lazy var stackView : UIStackView = {

        let sV = UIStackView()
        sV.axis = .vertical
    
        sV.spacing = 10
       

        [line1,sV3,line2,sV4,line3,sV5,line4,sV6,line5,sV7,line6,labell].forEach({sV.addArrangedSubview($0)})

        return sV
    }()
    
    lazy var bookImage = UIImageView().then {
        $0.image = UIImage(named: "book2")
    }
    
    lazy var bookTitle = UILabel().then {
        $0.text = model.title ?? "" //title
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    
    
    
    
    private func createLine() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.gray3)
        return view
    }
    
    
    private func navigationControl() {
        self.view.backgroundColor = .white
        self.navigationItem.title = model.title ?? "title"//title
    }
    
    
    //MARK: setupLayouts
    private func setupLayouts() {
        
        [stackView,bookImage,bookTitle].forEach{bookView.addSubview($0)}
        
        [
        infoView,
        nameLabel,
        bookNameLabel,
        majorLabel,
        label1,
        button1,
        button2,
        bookView,
        ].forEach{self.view.addSubview($0)}
        
    }
    
    //MARK: setupConstraints
    private func setupConstraints() {
        
        infoView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(92)
        }
        
        nameLabel.snp.makeConstraints {make in
            make.left.equalTo(infoView.snp.left).offset(16)
            make.top.equalTo(infoView.snp.top).offset(18)
        }
        
        bookNameLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            
        }
        
        majorLabel.snp.makeConstraints{ make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(32)
        }
        
        label1.snp.makeConstraints { make in
            make.leading.equalTo(infoView)
            make.top.equalTo(infoView.snp.bottom).offset(24)
            make.height.equalTo(14)
            
            
        }
        
        button1.snp.makeConstraints {make in
            make.trailing.equalTo(infoView)
            make.top.equalTo(infoView.snp.bottom).offset(26)
        }
        
        button2.snp.makeConstraints { make in
            make.trailing.equalTo(button1.snp.leading).offset(-8)
            make.top.equalTo(infoView.snp.bottom).offset(26)
            
        }
        
        bookView.snp.makeConstraints {make in
            make.leading.equalTo(label1)
            make.trailing.equalTo(button1)
            make.top.equalTo(label1.snp.bottom).offset(12)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-40)
            
        }
        
        stackView.snp.makeConstraints {make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
            
            
        }
        
        bookImage.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top).offset(-22)
            make.top.equalTo(bookTitle.snp.bottom).offset(30)
        }
        
        bookTitle.snp.makeConstraints {make in
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            
        }
        
        
        
        [line1,line2,line3,line4,line5,line6].forEach {
            $0.snp.makeConstraints {
                
                $0.height.equalTo(0.33)
            }
        }
        
        labell.setContentHuggingPriority(.defaultLow, for: .horizontal)
        labell.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        [author,publisher,year,type,url].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(63)
            }
            
        }
        
    }
}




#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct BookInfoViewPreview: PreviewProvider {
  static var previews: some View {
      BookInfoVC().toPreview()
  }
}
    #endif

