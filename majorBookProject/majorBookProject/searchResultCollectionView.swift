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

class searchResultCollectionView: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.cellSetting()
    }
    
    required init(coder: NSCoder){
        fatalError()
    }
    
    
    func cellSetting(){
        self.backgroundColor = .white
        
    }
    
    private let stackView: UIStackView = {
        let subjectName = UILabel()
        subjectName.text = "UNIX 디자인"
        subjectName.textColor = .black
        let professorName = UILabel()
        professorName.text = "이운형"
        professorName.textColor = .gray
        let major = UILabel()
        major.text = "전공선택" + "/ 디자인학부"
        
        let stackV = UIStackView(arrangedSubviews: [subjectName,professorName,major])
        
        stackV.axis = .horizontal
        stackV.alignment = .fill
        stackV.distribution = .equalSpacing
        stackV.spacing = 3
        
       return stackV
    }()
}
