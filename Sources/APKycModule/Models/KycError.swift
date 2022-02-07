//
//  KycError.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import Foundation

public enum KycError: Error, Identifiable {
    
    public var id: String { String(reflecting: self) }
    
    case genericError
    
    var description: String {
        switch self {
        case .genericError:
            return "Generic error"
        }
    }
}

extension KycError: Equatable {
    public static func == (lhs: KycError, rhs: KycError) -> Bool {
        return lhs.id == rhs.id
    }
}
