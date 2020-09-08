//
//  HomeViewModel.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/7/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import UIKit

class HomeViewModel {
        weak var dataSource : GenericDataSource<MobileDataModel>?
        weak var service: MobilesServiceProtocol?
        var onErrorHandling : ((ErrorResult?) -> Void)?
        var refreshInterval: Int? = nil
        
        init(dataSource : GenericDataSource<MobileDataModel>?) {
            self.dataSource = dataSource
            self.service = MobilesService.shared
        }
        
        func fetchMobiles() {
            guard let service = service else {
                onErrorHandling?(ErrorResult.custom(string: ""))
                return
            }
            
            service.fetchMobiles { (result) in
                // Callback from the Service layer
                switch result {
                    case .success(let data) :
                        print(data)

                    case .failure(let error) :
                        self.onErrorHandling?(error)
                    }
            }
        }
       
    }

