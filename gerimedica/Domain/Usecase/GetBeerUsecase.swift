//
//  GetBeerUsecase.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire

private protocol Usecase {
    
    mutating func getBeers(page:Int,perPage:Int,onCompletion:@escaping(Failure?,[Beer]?)->Void)
}

struct GetBeerUsecase : Usecase{

    private var beerRepo: BeerRepoImpl = BeerRepoImpl();
    
    mutating func getBeers(page:Int,perPage:Int,onCompletion:@escaping(Failure?,[Beer]?)->Void)  {
        
        beerRepo.fetchBeerListFromRepo(page: page,perPage: perPage) { fail, success in
            if let failure = fail {
                onCompletion(failure,nil)
            }
            if let newBeers = success {
                onCompletion(nil,newBeers)   
            }
        }
    }
}


