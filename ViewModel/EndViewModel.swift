//
//  EndViewModel.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/5/22.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore
import CoreLocation
class EndViewModel: ObservableObject{
    @Published  var indScore = 0.0
    @Published var openScore = 0.0
    @Published var respectScore = 0.0
    @Published var locScore = 0.0
    @Published var displayMean = false
    @Published var avgInd = 0.0
    @Published var avgOpen = 0.0
    @Published var avgRespect = 0.0
    @Published var avgLoc = 0.0
    func connectBackend(){
        FirebaseApp.configure()
    }
    func setData(ind: Any, open: Any, respect: Any, loc: Any ){
        let db = Firestore.firestore()
        db.collection("HumilityApp").document("Scores").setData(["indScore":ind,"openScore":open,
                                                                 "respectScore": respect, "locScore": loc], merge: true)
    }
    func setLocation(location: CLLocationCoordinate2D){
        let db = Firestore.firestore()
        let gp = GeoPoint(latitude: location.longitude, longitude: location.latitude)
        print(gp)
        db.collection("Location").addDocument(data: ["location":["latitude":location.latitude, "longitude": location.longitude]])
    }
    func getData()     {
        let db = Firestore.firestore()
        let docRef = db.collection("HumilityApp").document("Scores")

        docRef.getDocument { [self] (document, error) in
               guard error == nil else {
                   print("error", error ?? "")
                   return
               }

               if let document = document, document.exists {
                   let data = document.data()
                   if let data = data {
                       displayMean = true
                       for (keys, values) in data {
                           if keys == "openScore" {
                               self.openScore = data[keys] as! Double
                           }
                           else if keys == "indScore"{
                               self.indScore = data[keys] as! Double
                           }
                           else if keys == "respectScore" {
                               self.respectScore = data[keys] as! Double
                           }
                           else if keys == "locScore"{
                               self.locScore = data[keys] as! Double
                           }
                       
                       }
                   }
               }

           }
    }
    
    func calculateAverage(ind: Int,open: Int, respect: Int, loc: Int){
        let sumInd = Double(ind) + indScore
        let sumOpen = Double(open) + openScore
        let sumRespect = Double(respect) + respectScore
        let sumLoc = Double(loc) + locScore
         avgInd = Double(sumInd)/2
        avgOpen = Double(sumOpen)/2
        avgRespect = Double(sumRespect)/2
        avgLoc = Double(sumLoc)/2
        print(avgInd)
        
    }
    
    
    
}
