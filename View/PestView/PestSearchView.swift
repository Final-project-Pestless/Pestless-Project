//
//  PestSearch.swift
//  Pestless
//
//  Created by Aulia Rahmi on 24/11/22.
//

import SwiftUI

struct PestSearchView: View {
   // var searchedBiopesticide: [PestData]
    @State private var searchText = ""
    @State private var pestData: PestData?
    var body: some View {
        List {
            ForEach(searchResults) { pest in
                NavigationLink(destination:
                //Text(pest.name))
                PestResultDetailView(detectedPest: pest)) {
                    HStack {
                        Image(pest.image[0])
                            .resizable()
                            .frame(width: 60, height: 60)
                        VStack {
                            Text(pest.name)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Cari berdasarkan nama hama")
        .navigationTitle("Hama")
        .navigationBarTitleDisplayMode(.inline)
    }

    var searchResults: [PestData] {
        if searchText.isEmpty {
            return pestList
        } else {
            return pestList.filter{$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
}

struct PestSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PestSearchView()
    }
}
