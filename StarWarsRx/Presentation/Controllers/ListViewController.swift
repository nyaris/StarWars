//
//  ListViewController.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 27/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift

class ListViewController: UIViewController {
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewCard: UIView!
    
    var viewModel: ListViewModel!
    var disposeBag = DisposeBag()
    var delegate: ListViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSW()
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        view1.layer.cornerRadius = 18
        view2.layer.cornerRadius = 18
        view3.layer.cornerRadius = 18
        
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nave.png")!)

//        viewCard.layer.cornerRadius = 18
        
        bind()
    }
    
    static func instantiate(viewModel: ListViewModel) -> ListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        view.viewModel = viewModel
        return view
    }
    
        private func bind() {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            viewModel.swList.map { $0 ?? []
            }.drive(tableView.rx.items(cellIdentifier: "cell")) { index, model,
                cell in
                cell.textLabel?.text = model.name
                
            }.disposed(by: disposeBag)
            
            tableView.rx.itemSelected.bind { selectedIndex in
                guard let selectedSw = self.viewModel.getSW(at:
                    selectedIndex.row) else { return }
                let viewController = self.delegate?.didSelectSW(sw:
                    selectedSw)
                self.present(viewController!, animated: true, completion: nil)
                
            }.disposed(by: disposeBag)
            
        }
        
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
    
    protocol ListViewControllerDelegate {
        func didSelectSW(sw: SWResponse) -> UIViewController
    }
    


