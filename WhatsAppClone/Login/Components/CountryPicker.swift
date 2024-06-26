//
//  CountryPicker.swift
//  WhatsAppClone
//
//  Created by Developer on 21.06.2024.
//

import SwiftUI

struct CountryPicker: View {
    @Binding var selection: Locale.Region
    @Environment(\.locale) private var locale: Locale
    
    
    
    init(selection: Binding<Locale.Region>) {
        _selection = selection
    }
    
    private var regions: [Locale.Region] {
        Locale.Region.isoRegions.filter({ 
            locale.localizedString(forIdentifier: $0.identifier) != nil
        })
    }
    
    private var selectionCountryName: String {
        locale.localizedString(forRegionCode: selection.identifier) ?? ""
    }
    
    var body: some View {
        Picker("", selection: $selection) {
            ForEach(regions, id: \.identifier) { region in
                HStack(spacing: 0.0) {
                    Text(locale.localizedString(forRegionCode: region.identifier)!)
                        .foregroundStyle(.blue)
                    Spacer()
                    Text(getCountryPhoneCode(region.identifier))
                }
                    .tag(region)
            }
        }
        .pickerStyle(.navigationLink)
    }
}
