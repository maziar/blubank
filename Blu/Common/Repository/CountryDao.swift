//
//  CountryDao.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/30/22.
//

import Foundation
import CoreData

class CountryDao {
    var storageContext: CoreDataStorageContext
    
    init(storageContext: CoreDataStorageContext) {
        self.storageContext = storageContext
    }
    
    func getAll() -> [Country] {
        let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        do {
            var countries: [Country] = []
            let result = try storageContext.managedContext.fetch(request)
            for country in result {
                countries.append(country.toCountry())
            }
            return countries
        } catch {
            print("Fetched Failed")
        }
        return []
    }
    
    func search(searchText: String) -> [Country] {
        let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS %@", searchText)
        do {
            var countries: [Country] = []
            let result = try storageContext.managedContext.fetch(request)
            for country in result {
                countries.append(country.toCountry())
            }
            return countries
        } catch {
            print("Fetched Failed")
        }
        return []
    }
    
    func get(identifier: Int) -> CountryEntity? {
        return nil
    }
    
    func getSelected() -> [Country] {
        let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "selected = true")
        var countries: [Country] = []
        do {
            let result = try storageContext.managedContext.fetch(request)
            for country in result {
                countries.append(country.toCountry())
            }
            return countries
        } catch {
            print("Fetched Failed")
        }
        return []
    }
    
    func save(country: Country) -> Bool {
        if let entity = NSEntityDescription.entity(
            forEntityName: CountryEntity.nameOfClass,
            in: storageContext.managedContext),
           let newCountry = NSManagedObject(
            entity: entity,
            insertInto: storageContext.managedContext) as? CountryEntity {
            newCountry.id = Int64(country.id)
            newCountry.flag = country.flag
            newCountry.name = country.name
            newCountry.selected = country.selected
            
            do {
                try storageContext.managedContext.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }
    
    @discardableResult
    func saveAll(countries: [Country]) -> Bool {
        for country in countries {
            let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", String(country.id))
            let results = try? storageContext.managedContext.fetch(request)
            if let result = results, !result.isEmpty {
                continue
            }
            if let entity = NSEntityDescription.entity(
                forEntityName: CountryEntity.nameOfClass,
                in: storageContext.managedContext),
               let newCountry = NSManagedObject(
                entity: entity,
                insertInto: storageContext.managedContext) as? CountryEntity {
                newCountry.id = Int64(country.id)
                newCountry.flag = country.flag
                newCountry.name = country.name
                newCountry.selected = country.selected
            }
        }
        do {
            try storageContext.managedContext.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult
    func update(country: Country) -> Bool {
        let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", String(country.id))
        do {
            let result = try storageContext.managedContext.fetch(request)
            guard let objc = result.first else { return false }
            objc.setValue(country.selected, forKey: "selected")
            do {
                try storageContext.managedContext.save()
            } catch let error as NSError {
                debugPrint(error)
            }
        } catch let error as NSError {
            debugPrint(error)
        }
        return true
    }
    
    @discardableResult
    func deleteAll() -> Bool {
        let request: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "selected = false")
        do {
            let result = try storageContext.managedContext.fetch(request)
            for data in result {
                storageContext.managedContext.delete(data)
            }
            do {
                try storageContext.managedContext.save()
            } catch {
                return false
            }
        } catch let error as NSError {
            debugPrint(error)
            return false
        }
        return true
    }
}
