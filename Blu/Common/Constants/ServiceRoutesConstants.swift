//
//  ServiceRoutesConstants.swift
//  Blu
//
//  Created by Maziar Saadatfar on 12/28/22.
//

import Foundation

let SERVER_URL = "https://restcountries.com/"
let country_list_route = "https://restcountries.com/v3.1/all"
let country_slug = "https://restcountries.com/v3.1/all/{slug}"

func createApiRoute(route: String, slug: String = String()) -> String {
    let route = slug.isEmpty ? route : route.replacingOccurrences(of: "{slug}",
                                                                  with: slug)
    return route
}
