//
//  OnfidoViewModel.swift
//  Created by Tiago on 7/02/22.
//

import Foundation

class OnfidoViewModel {
    
    let applicantId: String
    let token: String
    let userSessionIsoCode: String
    
    init(applicantId: String, token: String, userSessionIsoCode: String) {
        self.applicantId = applicantId
        self.token = token
        self.userSessionIsoCode = userSessionIsoCode
    }
    
    var countryIsoCode: String? {
        return userSessionIsoCode
    }
    
    static func mock() -> OnfidoViewModel {
        return OnfidoViewModel(applicantId: "d93b1af8-234a-434b-87ca-0f4090557d73",
                               token: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTU4NDAxNDgsInBheWxvYWQiOiJobjlsSEhwc2JHRGpkU29xcER2aVJWL0U2MWpTVVVEQ2xSdmtlQzArSG9YdjlUWjA2YmcxYlg1OEpKUXhcbmVxNGcvc0tRMVp6dTZxUmYxMlcvYkVrS251cDNlaXZEVGwwOG5LRWd2YVgwbXB5dFQwenZWSUR3SGZYZ1xuNXduRkxZNE5sWnJ0QXorZ2VqVHlzb0x2MzJyVVR3PT1cbiIsInV1aWQiOiIwdkpWbWZFUXVfSyIsInVybHMiOnsidGVsZXBob255X3VybCI6Imh0dHBzOi8vdGVsZXBob255Lm9uZmlkby5jb20iLCJkZXRlY3RfZG9jdW1lbnRfdXJsIjoiaHR0cHM6Ly9zZGsub25maWRvLmNvbSIsInN5bmNfdXJsIjoiaHR0cHM6Ly9zeW5jLm9uZmlkby5jb20iLCJob3N0ZWRfc2RrX3VybCI6Imh0dHBzOi8vaWQub25maWRvLmNvbSIsImF1dGhfdXJsIjoiaHR0cHM6Ly9lZGdlLmFwaS5vbmZpZG8uY29tIiwib25maWRvX2FwaV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.xOpJfk43GdL3qGQiSu7Agh1wRxYAIU6oe6Ge_0iYs8U",
                               userSessionIsoCode: "COL")
    }
}
