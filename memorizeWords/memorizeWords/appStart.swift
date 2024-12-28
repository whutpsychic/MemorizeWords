//  appStart.swift
//  memorizeWords
//
//  Created by zbc on 2024/12/24.

import SwiftUI

struct AppStart: View {
    
    @AppStorage("hasViewedInitialGuide") var hasViewedInitialGuide: Bool = DefaultSettings.hasViewedInitialGuide

    var body: some View {
        if(!hasViewedInitialGuide){
            InitialGuide()
        }else{
            Home()
        }
    }
}

#Preview {
    AppStart()
}
