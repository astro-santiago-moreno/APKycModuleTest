//
//  SwiftUIView.swift
//  
//
//  Created by Tiago on 7/02/22.
//

import SwiftUI
import Onfido

public struct APKycView: View {
    
    @StateObject var apKycVM = APCKycViewModel()
    
    public var finish: () -> Void
    
    public init(finish: @escaping () -> Void) {
        self.finish = finish
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text("Welcome to the APKycFeature")
                .foregroundColor(Color.black)
            Button("Start") {
                apKycVM.show = true
            }
            Spacer()
        }
        .sheet(isPresented: $apKycVM.show, content: {
            OnfidoView(onfidoVM: OnfidoViewModel.mock()) { applicantId in
                self.apKycVM.show = false
                finish()
            } didCancel: { error, applicantId in
                self.apKycVM.show = false
                finish()
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        APKycView {}
    }
}
