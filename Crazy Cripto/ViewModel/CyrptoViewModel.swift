//
//  CyrptoViewModel.swift
//  Crazy Cripto
//
//  Created by Ahmet Burak Öztürk on 22.06.2024.
//

import Foundation
import RxSwift
import RxCocoa

class CyrptoViewModel {
    let cyrptoList : PublishSubject<[CyrptoModel]> = PublishSubject()
    
    func getDataResponse(){
        WebService.shared.downloadCurrencies { (result) in
            switch result {
            case .failure(.serverError):
                print("Server Error!")
                
            case .failure(.parsingError):
                print("Decoding Error!")
                
            case .success(let result):
                self.cyrptoList.onNext(result)
            }
            
        }
    }
}
