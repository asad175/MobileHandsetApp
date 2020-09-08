//
//  GenericDataSource.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/8/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

