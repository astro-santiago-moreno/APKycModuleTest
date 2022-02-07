//
//  KycServiceProtocol.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import Foundation

protocol KycServiceProtocol {
    
    func getKycProvider(source: String,
                        completion: @escaping (Result<KycProvider, KycError>) -> Void)
    func updateKycStatus(source: String, provider: String, applicantId: String?,
                         completion: @escaping (Result<Void, KycError>) -> Void)
}
