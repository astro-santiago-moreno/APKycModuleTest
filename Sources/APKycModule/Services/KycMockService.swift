//
//  KycMockService.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import Foundation

struct KycMockService: KycServiceProtocol {
    
    func getKycProvider(source: String,
                        completion: @escaping (Result<KycProvider, KycError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(KycProvider(provider: KycProvider.onfido, flow: KycProvider.sdk)))
        }
    }
    
    func updateKycStatus(source: String, provider: String, applicantId: String?,
                         completion: @escaping (Result<Void, KycError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(()))
        }
    }
    
}
