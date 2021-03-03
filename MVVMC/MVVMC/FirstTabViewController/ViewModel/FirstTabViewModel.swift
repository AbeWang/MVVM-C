//
//  FirstTabViewModel.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import Foundation

class FirstTabViewModel {
    var title: String? {
        didSet {
            titleDidChangedCallback?(title)
        }
    }
    
    // Observation callbacks
    var titleDidChangedCallback: ((String?) -> Void)?
    
    init() {
        // Mock binding
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.3) { [weak self] in
            self?.title = "First View"
        }
    }
}
