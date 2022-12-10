//
//  CatchEmAllApp.swift
//  CatchEmAll
//
//  Created by Remi Pacifico Hansen on 11/6/22.
//

import SwiftUI

@main
struct CatchEmAllApp: App {
    
    var body: some Scene {
        WindowGroup {
            CreaturesListView()
                .environmentObject(CreaturesViewModel())
                .environmentObject(CreatureDetailViewModel())
        }
    }
}
