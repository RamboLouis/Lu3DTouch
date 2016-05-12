//
//  AppDelegate.swift
//  Lu3DTouch
//
//  Created by Louis on 16/5/12.
//  Copyright © 2016年 RamboLu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    @available(iOS 9.0, *)
    enum ShortcutIdentifier: String {
        case First
        case Second
        case Third
        case Fourth
        
        /** 初始化 */
        init?(fullType: String) {
            guard let last = fullType.componentsSeparatedByString(".").last else {
                return nil
            }
            self.init(rawValue: last)
        }
        /** 特性类别 */
        var type: String {
            return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue)"
        }
    }
    
    // MARK: - 静态特性
    
    static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"
    
    var window: UIWindow?
    /** 设置ShortcutItem */
    var startShortcutItem: UIApplicationShortcutItem?
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        var handle = false
        /** 验证所提供的'shortcutItem' 的 "type" 是一个由应用程序处理 */
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else {
            return false
        }
        guard let shortCutType = shortcutItem.type as String? else {
            return false
        }
        /** 获取系统根控制器,并指定控制器*/
        let rootNavigationViewController = window!.rootViewController as? UINavigationController
        let rootViewController = rootNavigationViewController?.viewControllers.first as! ViewController?
        
        switch (shortCutType) {
        case ShortcutIdentifier.First.type:
            /** 样式一执行代码 */
            handle = true
            rootNavigationViewController?.popToRootViewControllerAnimated(false)
            rootViewController?.OneViewController()
        case ShortcutIdentifier.Second.type:
            /** 样式二执行代码 */
            handle = true
            rootNavigationViewController?.popToRootViewControllerAnimated(false)
            rootViewController?.TwoViewController()
        case ShortcutIdentifier.Third.type:
            /** 样式三执行代码 */
            handle = true
            rootNavigationViewController?.popToRootViewControllerAnimated(false)
            rootViewController?.ThreeViewController()
        case ShortcutIdentifier.Fourth.type:
            /** 样式四执行代码 */
            handle = true
            rootNavigationViewController?.popToRootViewControllerAnimated(false)
            rootViewController?.FourthViewController()
        default:
            break
        }
        
        return handle
    }
    
    // MARK: - 应用程序生命周期
    /** 如果应用程序处于非活动状态,就重新启动任何已暂停或尚未开始的任务,如果应用程序在后台，可以随意刷新用户界面 */
    func applicationDidBecomeActive(application: UIApplication) {
        print(#function)
        guard let shortcut = startShortcutItem else {
            return
        }
        
        handleShortCutItem(shortcut)
        
        startShortcutItem = nil
    }
    
    /** 如果应用程序从关闭被打开时，调用该函数: didFinishLaunchingWithOptions */
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print(#function)
        var shouldPerformAdditionalDelegateHandling = true
        
        /** 检测传入的信息，如果能够找到 UIApplicationShortcutItem 对象，就进行针对性的处理 */
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            startShortcutItem = shortcutItem
            //打开应用后停止“performActionForShortcutItem”方法
            shouldPerformAdditionalDelegateHandling = false
        }
        
        return shouldPerformAdditionalDelegateHandling
    }
    
    /** 如果应用程序已经在后台打开，调用该函数: performActionForShortcutItem */
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: Bool -> Void) {
        
        print(#function)
        let handledShortCutItem = handleShortCutItem(shortcutItem)
        
        completionHandler(handledShortCutItem)
    }
    
    
    
    
    
    
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

