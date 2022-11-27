//
//  PestSearch.swift
//  Pestless
//
//  Created by Aulia Rahmi on 24/11/22.
//

import SwiftUI

struct PestSearchView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
   // var searchedBiopesticide: [PestData]
    @State private var searchText = ""
    @State private var pestData: PestData?
    var body: some View {
        NavigationView {
            List {
                
                ForEach(searchResults) { pest in
                    NavigationLink(destination:
                    //Text(pest.name))
                    PestResultDetailView(detectedPest: pest)) { HStack {
                            Image(pest.image[0])
                            VStack {
                                Text(pest.name)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Hama")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    var searchResults: [PestData] {
        if searchText.isEmpty {
            return PestList
        } else {
            return PestList.filter{$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
//    var searchedPest: [PestData] {
//        if searchPest.count == 0 {
//            return PestList
//        } else {
//            return PestList.filter{$0.name.lowercased().contains(searchPest.lowercased())}
//        }
    //}
}

struct PestSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PestSearchView()
    }
}
