//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ondřej Tuček on 19.07.2024.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State var favoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{landmark in
                    (!favoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $favoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
