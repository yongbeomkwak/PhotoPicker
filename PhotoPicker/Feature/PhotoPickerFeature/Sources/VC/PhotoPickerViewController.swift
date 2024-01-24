//
//  PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

class PhotoPickerViewController: UIViewController {

    
    private let viewModel : PhotoPickerViewModel!
    fileprivate var input : PhotoPickerViewModel.Input!
    fileprivate var output: PhotoPickerViewModel.Output!
    
    
    init(viewModel: PhotoPickerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
}
