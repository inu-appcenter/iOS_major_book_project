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

class mainCell: UITableViewCell {
    
    
    static let identifier = "TableViewCell"

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setupLayouts()
            setupConstraints()
        }

        required init?(coder: NSCoder) {
            fatalError("")
        }
    
    lazy var subjectName = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }

    lazy var professorName = UILabel().then {
        $0.textColor = .gray
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }


    lazy var major = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = .gray
    }
    
    
    func SettingCell(data: Subject) {
        subjectName.text = data.name
        professorName.text = data.professor
        major.text = data.department
    }
    
    
    private func setupLayouts() {
        [subjectName,professorName,major].forEach{self.contentView.addSubview($0)}

    }
    
    private func setupConstraints() {
        subjectName.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(16)
        }
        professorName.snp.makeConstraints{
            $0.leading.equalTo(subjectName)
            $0.top.equalTo(subjectName.snp.bottom).offset(4)
        }
        major.snp.makeConstraints{
            $0.leading.equalTo(subjectName)
            $0.top.equalTo(professorName.snp.bottom).offset(10)
        }
        
        
        
        
        
    }
}



