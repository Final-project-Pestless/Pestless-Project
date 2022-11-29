//
//  BiopestBookmarkViewMode;.swift
//  Pestless
//
//  Created by Local Administrator on 27/11/22.
//

import Foundation
import CoreData
class BiopestBookmarkViewModel: NSObject,NSFetchedResultsControllerDelegate, ObservableObject  {
    @Published var biopestArray: [SavedBiopest] = []
    @Published var biopestExist = false
    
    static let shared = BiopestBookmarkViewModel(biopestBookmarkProvider: BiopestBookmarkProvider(persistenceController: PersistenceController.shared))
    private let biopestBookmarkProvider: BiopestBookmarkProvider
    private let fetchedResultController: NSFetchedResultsController<SavedBiopest>
    
    init( biopestBookmarkProvider: BiopestBookmarkProvider) {
        self.biopestBookmarkProvider = biopestBookmarkProvider
        self.fetchedResultController = NSFetchedResultsController(fetchRequest: biopestBookmarkProvider.fetchRequest, managedObjectContext: biopestBookmarkProvider.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func checkGame(id: UUID) {
        self.biopestExist = false
        let context = biopestBookmarkProvider.context
        
        do {
            self.biopestExist = try context.fetch(biopestBookmarkProvider.checkResult(id: id)).first != nil
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetch() {
        fetchedResultController.delegate = self
        try? fetchedResultController.performFetch()
        self.biopestArray = fetchedResultController.fetchedObjects ?? []
    }
    
    func save(biopest: BiopesticideData) {
        var biopestBookmark = SavedBiopest(context: biopestBookmarkProvider.context)
        biopestBookmark.id = UUID()
        biopestBookmark.name = biopest.name
        biopestBookmark.image = biopest.image
        PersistenceController.shared.save()
        self.biopestExist.toggle()
        
    }
    
    func deleteBiopest(id: UUID) {
        let context = biopestBookmarkProvider.context
        do {
            try context.delete(context.fetch(biopestBookmarkProvider.checkResult(id: id)).first!)
            self.biopestExist.toggle()
            self.fetch()
        } catch {
            print(error)
        }
    }
}
