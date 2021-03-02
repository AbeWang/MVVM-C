//
//  PushViewModel.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/3/2.
//

import Foundation

class PushViewModel {
    var parameters: [String: Any]?
    var title: String? {
        didSet {
            titleDidChangedCallback?(title)
        }
    }
    
    // Observation callbacks
    var titleDidChangedCallback: ((String?) -> Void)?
    
    init() {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) { [weak self] in
            self?.title = "Push View"
        }
    }
}
