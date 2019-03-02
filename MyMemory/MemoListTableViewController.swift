//
//  MemoListTableViewController.swift
//  MyMemory
//
//  Created by Wonik on 01/03/2019.
//  Copyright © 2019 Wonik. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.appDelegate.memolist.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //memolist배열에서 데이터에서 주어진 행에 맞는 데이터를 꺼냄
        let row = self.appDelegate.memolist[indexPath.row]
        
        //이미지 속성이 비었을 경우 "memoCell", 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        //재사용 큐로부터 프로토타입 셀의 인스턴스르 전달 받음
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        //MemoCell 내용 구성
        cell.lbSubject.text = row.title
        cell.lbContents.text = row.contents
        cell.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.lbRegdate.text = formatter.string(from: row.regdate!)
        
        return cell

        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //memolist 배열에서 선택된 행에 맞는 데이터를 꺼냄
        let row = self.appDelegate.memolist[indexPath.row]
        
        //상세 화면에서 인스턴스 생성
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadViewController else {
            return
        }
        
        //값을 전달한 다음, 상세 화면으로 이동
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
