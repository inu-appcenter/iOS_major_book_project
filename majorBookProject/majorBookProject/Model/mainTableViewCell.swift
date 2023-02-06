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

        private let containerView: UIView = {
            let containerView = UIView()
            containerView.backgroundColor = .white
            return containerView
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            self.contentView.addSubview(self.containerView)
            self.containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

        required init?(coder: NSCoder) {
            fatalError("")
        }
    
//    private let stackView: UIStackView = {
//        let subjectName = UILabel()
//        subjectName.text = "UNIX 디자인"
//        subjectName.textColor = .black
//        let professorName = UILabel()
//        professorName.text = "이운형"
//        professorName.textColor = .gray
//        let major = UILabel()
//        major.text = "전공선택" + "/ 디자인학부"
//
//        let stackV = UIStackView(arrangedSubviews: [subjectName,professorName,major])
//
//        stackV.axis = .horizontal
//        stackV.alignment = .fill
//        stackV.distribution = .equalSpacing
//        stackV.spacing = 3
//
//       return stackV
//    }()
    
}
