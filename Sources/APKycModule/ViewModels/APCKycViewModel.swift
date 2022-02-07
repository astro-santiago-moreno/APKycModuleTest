//
//  APCKycViewModel.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import SwiftUI

class APCKycViewModel: ObservableObject {
    
    @Published var show: Bool = false
    @Published var loading: Bool = false
    
    private let service: KycServiceProtocol
    
    init(_ service: KycServiceProtocol = KycMockService()) {
        self.service = service
    }
    
    func getProvider() {
        loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loading = false
            self.show = true
        }
    }
}
