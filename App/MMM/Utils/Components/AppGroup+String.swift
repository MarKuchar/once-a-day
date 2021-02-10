//
//  AppGroup+String.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-02-10.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import Foundation

public enum AppGroup: String {
  case group = "group.com.mmm.onestep.OAD-widget"

  public var containerURL: URL {
    switch self {
    case .group:
      return FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: self.rawValue)!
    }
  }
}
