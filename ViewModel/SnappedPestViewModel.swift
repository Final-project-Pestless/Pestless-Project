//
//  FavoriteViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import CoreData

class SnappedPestViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
    @Published var pest : PestImage?
    @Published var pestExist: Bool = false
    @Published var imageId: UUID?
    @Published var pestImage: Data?
    @Published var pestName: String = ""
    @Published var date: Date?
        
    static let shared = SnappedPestViewModel(pestService: SnappedPestService(persistenceController: PersistenceController.shared))
    
    private let pestService: SnappedPestService
    private let fetchedResultsController: NSFetchedResultsController<PestImage>
    
    init(pestService: SnappedPestService) {
        self.pestService = pestService
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: pestService.pestFetchRequest, managedObjectContext: pestService.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func save() {
        guard let snappedPest = self.pest else {return}
        snappedPest.imageId = self.imageId
        snappedPest.pestName = self.pestName
        snappedPest.pestImage = self.pestImage
        snappedPest.date = self.date
        pestService.saveChanges()
    }
    
    func cancelChanges() {
        pestService.rollback()
    }
}
