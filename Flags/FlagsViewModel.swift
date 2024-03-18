//
//  FlagsViewModel.swift
//  Flags
//
//  Created by Nikolay Zhukov on 17.03.2024.
//

import SwiftUI

class FlagsViewModel: ObservableObject {
    
    @Published var currentFlagIndex = 0
    @Published var nextFlagIndex = 1
    
    let flags = ["🇦🇫", "🇦🇽", "🏴‍☠️", "🇦🇱", "🇩🇿", "🇦🇩"]
    
    func changeFlag() {
        currentFlagIndex = (currentFlagIndex + 1) % flags.count
        nextFlagIndex = (currentFlagIndex + 1) % flags.count
    }
    
}

