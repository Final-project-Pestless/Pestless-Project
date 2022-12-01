//
//  AddTrackingView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 01/12/22.
//

import SwiftUI

struct AddTrackingView: View {
    @Environment(\.dismiss) var dismiss
    var biopesticide: BiopesticideData
    @State private var pickerDate = Date()
    @State var selectedPlant = plantList[0].name
    @State var selectedPest = pestList[0].name
    @State private var colorScheme = 1
    
    var body: some View {
        NavigationView {
            Form {
//                Section("Color Preferences") {
//                    Picker("Color Scheme", selection: $colorScheme) {
//                        Text("Light").tag(0)
//                        Text("Dark").tag(1)
//                    }
//                }
   
                Section("Biopestisida") {
                    Text(biopesticide.name)
                }
               
                Section("Tanaman"){
                    Picker("-Pilih Tanaman-", selection: $selectedPlant) {
                        ForEach(plantList) { plant in
                            Text(plant.name) }
                    }.pickerStyle(.wheel).frame(height: 100)
                }
                
                Section("Hama"){
                    Picker("-Pilih Hama-", selection: $selectedPest) {
                        ForEach(pestList) { pest in
                            Text(pest.name) }
                    }.pickerStyle(.wheel).frame(height: 100)
                }
                
                Section("Tanggal Pembuatan"){
                    DatePicker("Tanggal", selection: $pickerDate, displayedComponents: .date).datePickerStyle(.automatic)
                }
                
            }
            .navigationTitle("Mulai Tracking")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                Text("Cancel")
            }, trailing: Button(action:{
    //            guard !titleBook.isEmpty && !authorBook.isEmpty else { return }
    //            bookvm.addBook(title: titleBook, author: authorBook)
    //            titleBook = ""
    //            authorBook = ""
                dismiss()
            }){
                Text("Tambah")
            }
        )
        }
    }
}

struct AddTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        AddTrackingView(biopesticide: biopesticideList[0])
    }
}
