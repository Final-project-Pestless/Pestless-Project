//
//  Persistence.swift
//  Pestless
//
//  Created by Local Administrator on 31/10/22.
//

import CoreData
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(_ storageType: StorageType = .persistence) {
        
        container = NSPersistentContainer(name: "Pestless")
        if storageType == .inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            
        }
        
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    
    static var preview: PersistenceController = {
        let result = PersistenceController()
        let viewContext = result.container.viewContext
        for _ in 0..<10 {

            let newPest = PestImage(context: viewContext)
            newPest.imageId = UUID()
            newPest.pestImage = Data()
            newPest.pestName = String()
            newPest.date = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    enum StorageType {
        case persistence
        case inMemory
    }
    
    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
