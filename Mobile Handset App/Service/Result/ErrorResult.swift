//
//  ErrorResult.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/4/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
