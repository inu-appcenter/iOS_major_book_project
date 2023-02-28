//
//  expandableCell.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/19.
//

import Foundation
import ExpandableCell

class expandableCell: UITableViewCell { // 셀이 확장될 때 표시될 확장 가능한 콘텐츠를 포함

    static let identifier = "bookmarkCell"
    
    let title_ = UILabel()
    let author_ =  UILabel()
    lazy var bookmarkBtn_ = UIButton().then {
        $0.setImage(UIImage(named:"bookmark_line_big"), for: .selected)
        $0.setImage(UIImage(named:"bookmark_line_bigcheck"),for: .normal)
        $0.addTarget(self, action: #selector(didTapbookmarkBtn), for: .touchUpInside)
    }

    lazy var bookView = UIView().then {
        $0.backgroundColor = .white
    }

    //MARK: StackViewComponent

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

    lazy var sV3 : UIStackView = {
        let sV = UIStackView()
        sV.axis = .horizontal
        sV.distribution = .fill
        sV.spacing = 5


        let content = UILabel()
        content.text = "한혜진"
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
        content.text = "미진사"
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
        content.text = "2021"
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
        content.text = "국내서 단행본"
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

    //MARK: MainStackView

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
        $0.text = "가깝고 먼 이야기, 책:다채롭고 신비한 예술"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    lazy var bookmarkBtn = UIButton().then {
        $0.setImage(UIImage(named:"bookmark_line_big"), for: .selected)
        $0.setImage(UIImage(named:"bookmark_line_bigcheck"),for: .normal)
        $0.addTarget(self, action: #selector(didTapbookmarkBtn), for: .touchUpInside)
    }

    //MARK: init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("")
    }

    //MARK: @objc
    @objc func didTapbookmarkBtn() {
        bookmarkBtn_.isSelected = !bookmarkBtn_.isSelected
        print("tap btn")
    }

    //MARK: func

    func settingCell(isClicked:Bool) {

        setupLayouts(isClicked: isClicked)
        setupConstraints(isClicked: isClicked)

    }

    private func createLine() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.gray3)
        return view
    }

    //MARK: setupLayouts

    private func setupLayouts(isClicked: Bool){

        if isClicked {
            [stackView,bookImage,bookTitle,bookmarkBtn].forEach{bookView.addSubview($0)}
            self.contentView.addSubview(bookView)

        }
        else{
            [title_,author_,bookmarkBtn_].forEach({self.contentView.addSubview($0)})
        }
    }



    //MARK: setupConstraints
    private func setupConstraints(isClicked: Bool) {

        if isClicked{ //셀 확장시
            bookView.snp.makeConstraints{
                $0.edges.equalTo(self.contentView)
            }
            stackView.snp.makeConstraints{ //stackView의 superView는 bookView
                $0.bottom.trailing.leading.equalToSuperview().inset(20)
            }
            bookImage.snp.makeConstraints { //bookImage의 superView는 bookView
                $0.centerX.equalToSuperview()
                $0.bottom.equalTo(stackView.snp.top).offset(-20)
            }
            bookTitle.snp.makeConstraints{
                $0.top.equalTo(bookView.snp.top).offset(20)
                $0.left.equalTo(bookView.snp.left).offset(16)
            }
            bookmarkBtn.snp.makeConstraints {
                $0.right.equalTo(bookView.snp.right).offset(-16)
                $0.top.equalTo(bookView.snp.top).offset(16)
            }
        }
        else{ //default (화면 이동시 어떤 동작도 하지 않았을 시 보이는 화면)
            title_.snp.makeConstraints{
                $0.leading.equalToSuperview().offset(16)
                $0.top.equalToSuperview().offset(24)
            }

            author.snp.makeConstraints {
                $0.leading.equalTo(title_)
                $0.top.equalTo(title_.snp.bottom).offset(10)
            }

            bookmarkBtn_.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-16)
                $0.top.equalToSuperview().offset(28)
            }
        }

    }
}
