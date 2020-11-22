//
//  DetailsViewController.swift
//  tableViewSample
//
//  Created by Kishor Pahalwani on 04/07/19.
//  Copyright © 2019 Self. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var firstTabSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Details"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.bringSubviewToFront(tableView)
    }
    
    //Set TableView
    private func setTableView() {
        tableView.register(UINib(nibName: "Header", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(UINib(nibName: "FirstRowTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstRowTableViewCell")
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        //tableView.estimatedSectionFooterHeight = 0
        //tableView.tableFooterView?.frame = CGRect.zero
//
//        let viewF = UIView.init(frame: CGRect.zero)
//        viewF.backgroundColor = .purple
//        tableView.tableFooterView = viewF
        //tableView.sectionFooterHeight = 0
        //tableView.estimatedSectionFooterHeight = 0
    }
}

//Extension TableView Delegates
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if firstTabSelected {
            return 3
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if firstTabSelected {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstRowTableViewCell") as? FirstRowTableViewCell
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as? SecondTableViewCell
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.estimatedSectionHeaderHeight = 300
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let headerViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? Header {
            
            headerViewCell.frame.size.width = self.view.frame.width
            headerViewCell.segment.addTarget(self, action: #selector(tapSegments), for: .valueChanged)
            //headerViewCell.contentView.backgroundColor = .red
            /*headerViewCell.section = section
            headerViewCell.btnExpand.tag = section
            headerViewCell.btnStartQuiz.tag = section
            headerViewCell.btnDownArrow.tag = section
            headerViewCell.btnCustomQuiz.tag = section
            
            headerViewCell.btnExpand.addTarget(self, action: #selector(btnExpandClicked), for: .touchUpInside)
            headerViewCell.btnStartQuiz.addTarget(self, action: #selector(startQuiz), for: .touchUpInside)
            headerViewCell.btnDownArrow.addTarget(self, action: #selector(gotoDetailsViewTopic), for: .touchUpInside)
            headerViewCell.btnCustomQuiz.addTarget(self, action: #selector(addToCustomQuiz), for: .touchUpInside)
            
            if(searchActive) {
                headerViewCell.setHeader(subject: filtered[section])
            }
            else {
                headerViewCell.setHeader(subject: selectedSubject[section])
            }*/
            
            return headerViewCell
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension DetailsViewController {
    @objc func tapSegments(segment: UISegmentedControl) {
        print("Segment Tab selected index... \n ")
        print(segment.selectedSegmentIndex)
        
        firstTabSelected = !firstTabSelected
        
        //tableView.reloadSections([0], with: .fade)
        
        /*let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.tableView.reloadSections(sections as IndexSet, with: .automatic)*/
        
        /*tableView.beginUpdates()
        tableView.reloadSections([0], with: .fade)
        tableView.endUpdates()*/
        UIView.transition(with: tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
        //tableView.reloadData()
    }
}
