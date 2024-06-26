//
//  LoginView.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI


struct LoginView: View {
    @State private var loginProfile: Bool = false
    @State private var selection: Locale.Region  = Locale.Region.turkey
    @State private var phone: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        CountryPicker(selection: $selection)
                            .listRowInsets(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 10.0))
                        HStack {
                            Text("+\(getCountryPhoneCode(selection.identifier))")
                            TextField("", text: $phone)
                                .onChange(of: phone) {
                                   if !phone.isEmpty {
                                       phone = phone.formatPhoneNumber()
                                    }
                                 }
                        }
                    } header: {
                        Text("WhatsApp will need to verify your account. Carrier changes may apply.")
                            .font(.system(size: 15.0, weight: .medium))
                            .textCase(nil)
                            .listRowInsets(EdgeInsets(top: 10.0, leading: 0.0, bottom: 10.0, trailing: 0.0))
                    }
                }
                Button {
                    loginProfile = true
                } label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10.0))
                .padding(.horizontal)
            }
            .navigationTitle("Enter your phone number")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Link as companion") {
                            
                        }
                        Button("Help") {
                            
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.blue)
                    }

                }
            }
            .navigationDestination(isPresented: $loginProfile) {
                LoginProfileView()
            }
        }
    }
}

#Preview {
    LoginView()
}
