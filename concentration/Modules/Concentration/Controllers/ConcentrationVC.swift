//
//  ConcentrationVC.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import UIKit

class ConcentrationVC: UIViewController {
    
    // MARK: - Dependencies
    let viewModel: ConcentrationViewModel
    
    // MARK: - Lifecycle
    init(viewModel: ConcentrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  .systemBackground
    }
    

}
