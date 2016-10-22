//
//  Dictionary+Update.swift
//  MHGBaseProject
//
//  Created by Heguang Miao on 23/03/2016.
//  Copyright © 2016 YoFlea. All rights reserved.
//

import Foundation

func +=<K, V> ( left: inout [K : V], right: [K : V]) { for (k, v) in right { left[k] = v } }
