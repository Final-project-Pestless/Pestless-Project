//
//  AddTrackingView.swift
//  Pestless
//
//  Created by Aulia Rahmi on 01/12/22.
//

import SwiftUI

struct AddTrackingView: View {
    private let container = PersistenceController.shared.container
    @ObservedObject var trackerViewModel = TrackerViewModel()
    @Environment(\.dismiss) var dismiss
    var biopesticide: BiopesticideData
    @State private var pickerDate = Date()
    @State var selectedPlantIndex: Int = 0
    @State var selectedPestIndex: Int = 0
//    @State var selectedPest: PestData
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
                    Picker("-Pilih Tanaman-", selection: $selectedPlantIndex) {
                        ForEach(plantList.indices) { index in
                            Text(plantList[index].name)
                                .tag(index)

                        }
                    }
                    
                    .pickerStyle(.wheel).frame(height: 100)
                       
                }
                
                
                Section("Hama"){
                    Picker("-Pilih Hama-", selection: $selectedPestIndex) {
                        ForEach(pestList.indices) { index in
                            Text(pestList[index].name)
                                .tag(index)
                        }
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
//                let plant = Tracking(context: container.viewContext)
//                plant.dateStarted = pickerDate
                trackerViewModel.createTracker(plant: plantList[selectedPlantIndex].name, biopest: biopesticide.name, pest:pestList[selectedPestIndex].name , date: pickerDate)
//                trackerViewModel.saveChanges(tracker: plant )
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
