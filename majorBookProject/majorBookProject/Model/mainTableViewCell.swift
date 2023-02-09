//
//  searchResultCollectionView.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/05.
//
import Then
import SnapKit
import UIKit
import Foundation

class mainTableViewCell: UITableViewCell {
    
    
    static let identifier = "TableViewCell"

//        private let containerView: UIView = {
//            let containerView = UIView()
//            containerView.backgroundColor = .white
//            return containerView
//        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setupLayouts()
            setupConstraints()
        }

        required init?(coder: NSCoder) {
            fatalError("")
        }
    
    
    
    private let stackView: UIStackView = {
        let subjectName = UILabel()
        subjectName.text = "UNIX 디자인"
        subjectName.textColor = .black
        subjectName.font = UIFont(name: "Pretendard-Regular", size: 14)

        let professorName = UILabel()
        professorName.text = "이운형"
        professorName.textColor = .gray
        professorName.font = UIFont(name: "Pretendard-Regular", size: 12)

        let major = UILabel()
        major.text = "전공선택" + "/ 디자인학부"
        major.font = UIFont(name: "Pretendard-Regular", size: 12)
        major.textColor = .gray

        let stackV = UIStackView(arrangedSubviews: [subjectName,professorName,major])

        stackV.axis = .vertical
        stackV.alignment = .fill
        stackV.distribution = .equalSpacing
        stackV.spacing = 3

       return stackV
    }()
    
    
    private func setupLayouts() {
        
//        [
//
//            stackView
//        ].forEach{self.contentView.addSubview($0)}
        self.contentView.addSubview(stackView)
    }
    private func setupConstraints() {
        
//        self.containerView.snp.makeConstraints{ make in
//            make.edges.equalToSuperview()
////            make.height.equalTo(84)
//        }
        
        
        
        stackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
        }
    }
    
}
