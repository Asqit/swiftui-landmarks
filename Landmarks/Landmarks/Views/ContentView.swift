//
//  ContentView.swift
//  Landmarks
//
//  Created by Ondřej Tuček on 19.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
