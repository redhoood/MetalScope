//
//  InterfaceOrientationProvider.swift
//  Panoramic
//
//  Created by Jun Tanaka on 2017/01/17.
//  Copyright © 2017 eje Inc. All rights reserved.
//

import UIKit

public protocol InterfaceOrientationProvider {
	func interfaceOrientation(atTime time: TimeInterval) -> Rotation?
}

extension UIApplication: InterfaceOrientationProvider {
	public func interfaceOrientation(atTime time: TimeInterval) -> Rotation? {
		var rotation = Rotation()

		switch statusBarOrientation {
		case .portraitUpsideDown:
			rotation.rotate(byZ: .pi)
		case .landscapeLeft:
			rotation.rotate(byZ: .pi / 2)
		case .landscapeRight:
			rotation.rotate(byZ: .pi / -2)
		default:
			break
		}

		return rotation
	}
}

public final class DefaultInterfaceOrientationProvider: InterfaceOrientationProvider {
	public static let shared = DefaultInterfaceOrientationProvider()

	public func interfaceOrientation(atTime time: TimeInterval) -> Rotation? {
		return UIApplication.shared.interfaceOrientation(atTime: time)
	}
}