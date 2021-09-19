//
//  PostByUserEntity.swift
//  TestiOS
//
//

import Foundation

struct post: Codable{
    let userId:Int
    let id:Int
    let title:String
    let body:String
}
