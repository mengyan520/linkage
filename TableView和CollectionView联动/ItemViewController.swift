//
//  ItemViewController.swift
//  LiWuShuo
//
//  Created by Youcai on 2017/4/19.
//  Copyright © 2017年 mm. All rights reserved.
//https://api.liwushuo.com/v2/item_categories/tree?

import UIKit
import ObjectMapper
private let ID = "left"
private let collID = "coll"
private let headerID = "header"
class ItemViewController: UIViewController {
    var names:[Categories]? {
        didSet {
            tableView.reloadData()
            collectionView.reloadData()
            tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WHITE_COLOR
        view.addSubview(tableView)
        view.addSubview(collectionView)
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - loadData
    func loadData()  {
        NetworkTools.shardTools.CategoryWithItems { (response, error) in
            
            if error == nil {
                guard let object = response as? [String: AnyObject] else {
                    print("格式错误")
                    return
                }
                let model = Mapper<Model>().map(JSON: object)
                if model?.message  == "OK" {
                    self.names = model?.data?.categories
                    
                }else {
                    
                }
                
            }else {
                
                
            }
        }
    }
    // MARK: - Lazy
    
    fileprivate var currentSection = 0
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: 80, height: SCREEN_HEIGHT-40), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 55
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(x: 80, y: 0 , width: SCREEN_WIDTH - 80, height: SCREEN_HEIGHT-40), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (SCREEN_WIDTH - 80 - 20) / 3, height: (SCREEN_WIDTH - 80 - 20) / 3 + 30)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(RightCollectionViewCell.self, forCellWithReuseIdentifier: collID)
        collectionView.register(RightCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        return collectionView
    }()
}
// MARK: - UITableViewDelegate/UITableViewDataSource
extension ItemViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ID) as? LeftTableViewCell
        if cell == nil {
            cell = LeftTableViewCell.init(style: .default, reuseIdentifier: ID)
        }
        
        
        cell?.name = names?[indexPath.row].name
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: IndexPath.init(row: 0, section: indexPath.row), at: .top, animated: true)
    }
}
// MARK: - UICollectionViewDelegate/UICollectionViewDataSource
extension ItemViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return names?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names![section].subcategories?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collID, for: indexPath) as! RightCollectionViewCell
        cell.data = names?[indexPath.section].subcategories?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as! RightCollectionReusableView
        
        view.name = names?[indexPath.section].name
        if indexPath.section == 0 {
            view.isHidden = true
        }else {
            view.isHidden = false
        }
        
        return view
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 50)
    }
    
    // 当拖动 CollectionView 的时候，处理 TableView
    func selectRow(index : Int) {
        
        tableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .middle)
    }
    
    // 标记一下 CollectionView 的滚动方向，是向上还是向下
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView == scrollView {
            
            if collectionView.isDragging {
                let section = (collectionView.indexPathsForVisibleItems.min()?.section)!
                if currentSection == section {
                    return
                }
                selectRow(index:section )
                currentSection = section
            }
        }
    }
    
}
