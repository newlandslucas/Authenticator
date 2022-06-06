//
//  CredentialsLoginView.swift
//  AuthenticatorDemo
//
//  Created by Lucas Machado (Estudos) on 06/06/22.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack (spacing: 40) {
            Title()
            
            TextField("UserName", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.authenticatenWithCredentials(username: username, password: password)
                }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}
