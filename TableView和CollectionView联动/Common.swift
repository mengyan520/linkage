//
//  Common.swift
//  youCai
//
//  Created by Youcai on 16/3/4.
//  Copyright © 2016年 mm. All rights reserved.
//

import UIKit
import SnapKit

//MARK:- 颜色
let BLACK_COLOR      = UIColor.black
let DARKGRAY_COLOR   = UIColor.darkGray
let LIGHTGRAY_COLOR  = UIColor.lightGray
let WHITE_COLOR      = UIColor.white
let CLEAR_COLOR      = UIColor.clear
let RED_COLOR        = UIColor.red
let GRAY_COLOR       = UIColor.gray
let YELLOW_COLOR       = UIColor.yellow
let LINECOLOR = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
//主题色
let mainColor = UIColor(red: 255.0/255.0, green: 2.0/255.0, blue: 51.0/255, alpha: 1.0)
let TableCorlor = UIColor(red: 250/255.0, green: 242/255.0, blue: 245/255, alpha: 1.0)
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}
func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor{
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
//MARK:- Size
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT =  UIScreen.main.bounds.size.height
let ScaleX = (SCREEN_HEIGHT > 480 ? SCREEN_WIDTH/320 : 1.0)
let ScaleY = (SCREEN_HEIGHT > 480 ? SCREEN_HEIGHT/568 : 1.0)
//MARK:- Font
func Font(fontSize:CGFloat) ->UIFont  {
    
    return UIFont.systemFont(ofSize: fontSize)
}
//粗体
func BFont(fontSize:CGFloat) ->UIFont  {
    
    return UIFont.boldSystemFont(ofSize: fontSize)
}

// MARK: - 通知
func POSTNOTIFICATION(name:String,data:[AnyHashable : Any]?) {
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil, userInfo: data )
}
func REMOVENOTIFICATION(sender:AnyObject) {
    NotificationCenter.default.removeObserver(sender)
    
}
// MARK: - Device
let iPad = UIDevice.current.userInterfaceIdiom == .pad ? true : false
let iPhone = UIDevice.current.userInterfaceIdiom == .phone ? true : false
