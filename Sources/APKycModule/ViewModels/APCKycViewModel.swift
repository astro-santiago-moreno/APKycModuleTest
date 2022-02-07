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
        self.service.getKycProvider(source: "Onfido") { _ in
            self.loading = false
            self.show = true
        }
    }
}
