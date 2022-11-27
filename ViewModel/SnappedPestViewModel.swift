//
//  FavoriteViewModel.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import Foundation
import CoreData

class SnappedPestViewModel: NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
//    @Published var pest : PestImage?
    @Published var pestArray: [PestImage] = []
    @Published var pestExist: Bool = false
        
    static let shared = SnappedPestViewModel(pestService: SnappedPestRepository(persistenceController: PersistenceController.shared))
    
    private let pestService : SnappedPestRepository
    private let fetchedResultsController : NSFetchedResultsController<PestImage>
    
    init(pestService: SnappedPestRepository) {
        self.pestService = pestService
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: pestService.pestFetchRequest, managedObjectContext: pestService.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func fetch() {
        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
        self.pestArray = fetchedResultsController.fetchedObjects ?? []
        
    }
    
    func checkPest(id: UUID) {
        self.pestExist = false
        let context = pestService.context
        
        do {
            self.pestExist = try context.fetch(pestService.checkResult(id: id)).first != nil
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func save(id: UUID, imageData: Data, pestName: String) {
        let pestImage = PestImage(context: pestService.context)
        pestImage.imageId = UUID()
        pestImage.pestImage = imageData
        pestImage.pestName = pestName
        
        pestService.saveChanges()
        self.fetch()
        self.pestExist.toggle()
        
    }
    
    func deleteImage(id: UUID) {
        let context = pestService.context
        do {
            try context.delete(context.fetch(pestService.checkResult(id: id)).first!)
            self.pestExist.toggle()
            self.fetch()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func cancelChanges() {
        pestService.rollback()
    }
}
