//
//  APKycView.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import SwiftUI

class APKycView: ObservableObject {
    
    @Published var loading: Bool = false
    @Published var showProvider: Bool = false
    
    func showProvider() {
        self.showProvider = true
    }
    
    func hideProvider() {
        self.showProvider = false
    }
}
