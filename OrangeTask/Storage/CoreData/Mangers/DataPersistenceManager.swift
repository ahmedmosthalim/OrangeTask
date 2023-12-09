//
//  DataPersistenceManager.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 09/12/2023.
//

import CoreData
import UIKit

class DataPersistenceManager {
    static let shared = DataPersistenceManager()
    
    private init() {}
    
    
    func saveArticle(model: Article) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ArticleCoreDataModel", in: context)!
        let object = NSManagedObject(entity: entity, insertInto: context)
        if let url = model.url {
            object.setValue(url, forKey: "articleURL")
        }
        if let imageURl = model.urlToImage {
            object.setValue(imageURl, forKey: "imageURL")
        }
        if let source = model.source?.name {
            object.setValue( source, forKey: "source")
        }
        if let title = model.title {
            object.setValue( title, forKey: "title")
        }
        if let author = model.author {
            object.setValue(author, forKey: "author")
        }
        if let description = model.description  {
            object.setValue(description, forKey: "desc")
        }
        do {
            try context.save()
            print("✅ Article Saved Local successfully")
        } catch {
            print("❌ Can't save Article")
        }
    }
    func fetchArticles(completion: @escaping ([Article]) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        var articles = [Article]()
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ArticleCoreDataModel")
        
        do {
            let result = try context.fetch(fetchRequest)
            result.forEach { _ in
                var article = Article()
                article.url  = result.first?.value(forKey: "articleURL") as? String
                article.author = result.first?.value(forKey: "author") as? String
                article.title = result.first?.value(forKey: "title") as? String
                article.description = result.first?.value(forKey: "desc") as? String
                article.urlToImage = result.first?.value(forKey: "imageURL") as? String
                article.source?.name = result.first?.value(forKey: "source") as? String
                articles.append(article)
            }
            completion(articles)
            print("✅ Articles fetched successfully")
        } catch {
            print("❌ Can't fetch Articles")
        }
        
    }
    
    func entityIsEmpty()-> Bool{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return true }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ArticleCoreDataModel")

        do {
            let result = try context.fetch(fetchRequest)
            if result.isEmpty {
                print("data not exist")
                return true
            } else {
                print("data exist")
                return false
            }

        } catch {
            print(error)
            return true
        }
    }
    
}
