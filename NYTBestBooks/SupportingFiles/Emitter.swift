//
//  Emitter.swift
//  NYTBestBooks
//
//  Created by Howard Chang on 2/12/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

final class Emitter {
    static func get(with image: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
    var cells = [CAEmitterCell]()
    let cell = CAEmitterCell()
    cell.contents = image.cgImage
    cell.birthRate = 1.75
    cell.lifetime = 40
    cell.velocity = CGFloat(100)
    cell.velocityRange = CGFloat(20)
    cell.emissionLongitude = (180 * (.pi / 180))
    cell.emissionRange = (45 * (.pi / 180))
    cell.scale = 0.5
    cell.scaleRange = 0.3
    cell.spin = (60 * (.pi / 180))
    cells.append(cell)
    return cells
    }
}
