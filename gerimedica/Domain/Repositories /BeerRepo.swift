//
//  BeerRepo.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Foundation
import Alamofire
import UIKit

private protocol BeerRepo {
    
    // All CRUD opration can/will come here
    func fetchBeerListFromRepo(page:Int,perPage:Int, onCompletion:@escaping(Failure?,[Beer]?)->Void)
}

struct BeerRepoImpl : BeerRepo{
    
    public init() {}
    
    private func callGetBeerRestAPI(url:String ,params:Parameters?, completion:@escaping(Result<[Beer],AFError>)->Void){
        
        AF.request(url,method: .get, parameters: params).validate(statusCode: 200..<300).responseDecodable(of: [Beer].self) { response in
            completion(response.result)
        }
    }
    
     func fetchBeerListFromRepo(page:Int,perPage:Int, onCompletion:@escaping(Failure?,[Beer]?)->Void)
    {
        if(page < 1 || perPage < 1){
            onCompletion(ParamFailure(""),nil)
        }
        
        let parameters = ["page": String(page),"per_page":String(perPage)]
        NetworkMonitor.shared.startMonitoring()
        if NetworkMonitor.shared.isConnected {
            callGetBeerRestAPI(url: Constants.kApiUrl, params: parameters) { result in
                switch result {
                case .success:
                    if let beers = try? result.get() {
                        print("\(beers.count) beers")
                        onCompletion(nil, beers)
                    }
                case let .failure(error):
                    onCompletion(ServerFailure(error.localizedDescription),nil)
                }
                
            }
        }
        else {
            NetworkMonitor.shared.stopMonitoring()
            NetworkMonitor.shared.startMonitoring()
            onCompletion(NetworkFailure(""),nil)
            
        }
         
    }
    
}





