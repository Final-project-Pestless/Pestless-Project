//
//  FavoriteViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import CoreData

class PestViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
    @Published var pest : [Pest] = []
    @Published var pestExist: Bool = false
    
    static let shared = PestViewModel(pestService: PestService(persistenceController: PersistenceController.shared))
    
    private let pestService: PestService
    private let fetchedResultsController: NSFetchedResultsController<Pest>
    
    init(pestService: PestService) {
        self.pestService = pestService
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: pestService.pestFetchRequest, managedObjectContext: pestService.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    func fetch() {
        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
        self.pest = fetchedResultsController.fetchedObjects ?? []
    }
    
    func save() {
        
    }
}
