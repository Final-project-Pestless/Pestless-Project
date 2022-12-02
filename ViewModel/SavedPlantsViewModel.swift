//
//  SavedPlantsViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 01/12/22.
//

import Foundation
import CoreData

class SavedPlantsViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
    @Published var plantsArray: [MyPlants] = []
    @Published var plantExist: Bool = false
    private let savedPlantProvider : SavedPlantProvider
    private let fetchedResultController : NSFetchedResultsController<MyPlants>
    private let container = PersistenceController.shared.container
    static let shared = SavedPlantsViewModel(savedPlantProvider: SavedPlantProvider(persistenceController: PersistenceController.shared))
    
    init(savedPlantProvider: SavedPlantProvider) {
        self.savedPlantProvider = savedPlantProvider
        self.fetchedResultController = NSFetchedResultsController(fetchRequest: savedPlantProvider.fetchRequest, managedObjectContext: savedPlantProvider.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func checkPlant(id: UUID) {
        let context = savedPlantProvider.context
        do {
            self.plantExist = try context.fetch(savedPlantProvider.checkResult(id: id)).first != nil
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetch() {
        fetchedResultController.delegate = self
        try? fetchedResultController.performFetch()
        self.plantsArray = fetchedResultController.fetchedObjects ?? []

    }
    func save(plant: PlantData) {
        let savedPlant = MyPlants(context: savedPlantProvider.context)
        savedPlant.id = plant.id
        savedPlant.plantName = plant.name
        savedPlant.image = plant.image
        
        if savedPlant.hasChanges {
            try? self.container.viewContext.save()
        } else {
            print("no data saved")
        }
        self.plantExist = true
        self.fetch()
    }
    
    func deletePlant(id: UUID) {
        let context = savedPlantProvider.context
        do {
            try context.delete(context.fetch(savedPlantProvider.checkResult(id: id)).first!)
            self.plantExist = false
            self.fetch()
        } catch {
            print(error)
        }
    }
}
