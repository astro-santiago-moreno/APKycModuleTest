//
//  KycService.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import Foundation

struct KycService: KycServiceProtocol {
    
    func getKycProvider(source: String,
                        completion: @escaping (Result<KycProvider, KycError>) -> Void) {
        completion(.success(KycProvider(provider: KycProvider.onfido, flow: KycProvider.sdk)))
    }
    
    func updateKycStatus(source: String, provider: String, applicantId: String?,
                         completion: @escaping (Result<Void, KycError>) -> Void) {
        completion(.success(()))
    }
    
}
