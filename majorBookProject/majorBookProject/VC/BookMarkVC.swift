//
//  BookMarkVC.swift
//  majorBookProject
//
//  Created by 김민정 on 2023/02/13.
//

import UIKit
import SnapKit
import Then

class BookMarkVC: UIViewController {
    
    private let tableView: UITableView = {
        let tV =  UITableView(frame: .zero, style: .plain)
        tV.layer.cornerRadius = 5
        tV.layer.borderColor = UIColor.appColor(.gray3).cgColor
        tV.layer.borderWidth = 1
        tV.backgroundColor = .white
        tV.register(preferCell.self, forCellReuseIdentifier: preferCell.identifier)
        tV.separatorColor = UIColor.appColor(.gray3)
        tV.separatorInset.left = 0
        tV.rowHeight = 51
        return tV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        setupConstraints()
        
    }
    
    private func setupLayouts() {
        
    }
    
    private func setupConstraints() {
        
    }
    
}
