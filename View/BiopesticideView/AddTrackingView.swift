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
                
                Section("Tanggal Mulai Semprot"){
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
                let dateEnded = trackerViewModel.dateEnded(date: pickerDate)
                trackerViewModel.createTracker(plant: plantList[selectedPlantIndex].name, biopest: biopesticide.name, pest:pestList[selectedPestIndex].name , dateStarted: pickerDate, dateEnded: dateEnded)
                let array = trackerViewModel.arrayDate(dateStarted: pickerDate)
                print(array)
                
              
                
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
