//
//  SecondTabViewModel.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import Foundation

class SecondTabViewModel {
    var title: String? {
        didSet {
            titleDidChangedCallback?(title)
        }
    }
    
    // Observation callbacks
    var titleDidChangedCallback: ((String?) -> Void)?
    
    init() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) { [weak self] in
            self?.title = "Second View"
        }
    }
}
