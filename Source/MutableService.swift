//
//  MutableService.swift
//  RxBluetoothKit
//
//  Created by Andrew Breckenridge on 6/20/16.
//  Copyright © 2016 Polidea. All rights reserved.
//

import Foundation
import CoreBluetooth

public class MutableService: RxMutableServiceType {
    
    let service: RxMutableServiceType
    init(service: RxMutableServiceType) {
        self.service = service
    }
    
    /// Service's UUID
    public var UUID: CBUUID {
        return service.UUID
    }
    
    /// Service's characteristics
    public var characteristics: [MutableCharacteristic]? {
        return service.characteristics?.map {
            MutableCharacteristic(characteristic: $0, service: self)
            } ?? nil
    }
    
    /// Service's included services
    public var includedServices: [MutableService]? {
        return service.includedServices?.map(MutableService.init) ?? nil
    }
    
    /// True if service is primary service
    public var isPrimary: Bool {
        return service.isPrimary
    }
    
}