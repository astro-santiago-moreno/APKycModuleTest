//
//  OnfidoView.swift
//  Created by Tiago on 7/02/22.
//

import SwiftUI
import Onfido

struct OnfidoView: UIViewControllerRepresentable {
    
    let onfidoVM: OnfidoViewModel
    
    var didFinish: (_ applicantId: String) -> Void
    var didCancel: (_ error: String?, _ applicantId: String) -> Void
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<OnfidoView>) -> UIViewController {
        do {
            var documentConfig: GenericDocumentConfiguration?
            if let country = self.onfidoVM.countryIsoCode {
                documentConfig = GenericDocumentConfiguration(country: country)
            }
            let config = try OnfidoConfig.builder()
                .withSDKToken(self.onfidoVM.token)
                .withWelcomeStep()
                .withDocumentStep(ofType: .generic(config: documentConfig))
                .withFaceStep(ofVariant: .photo(withConfiguration: nil))
                .build()
            let responseHandler: (OnfidoResponse) -> Void = { response in
                switch response {
                case .error(let error):
                    didCancel(error.localizedDescription, self.onfidoVM.applicantId)
                case .success:
                    didFinish(self.onfidoVM.applicantId)
                case .cancel:
                    didCancel(nil, self.onfidoVM.applicantId)
                @unknown default:
                    didCancel(nil, self.onfidoVM.applicantId)
                }
            }
            let onfidoFlow = OnfidoFlow(withConfiguration: config)
                .with(responseHandler: responseHandler)
            let onfidoRun = try onfidoFlow.run()
            return onfidoRun
        } catch {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.red
            didFinish("")
            return vc
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<OnfidoView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onfidoVM, didFinish: didFinish, didCancel: didCancel)
    }
    
    class Coordinator: NSObject {
        
        private let onfidoVM: OnfidoViewModel
        var didFinish: (_ applicantId: String) -> Void
        var didCancel: (_ error: String?, _ applicantId: String) -> Void
        
        init(_ onfidoVM: OnfidoViewModel, didFinish: @escaping (String) -> Void, didCancel: @escaping (String?, String) -> Void) {
            self.onfidoVM = onfidoVM
            self.didFinish = didFinish
            self.didCancel = didCancel
        }
    }
}
