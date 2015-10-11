//
//  InterfaceController.swift
//  LuckyNumber WatchKit Extension
//
//  Created by chenyufeng on 15/10/11.
//  Copyright © 2015年 nbdpc. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  @IBOutlet var image: WKInterfaceImage!
  @IBOutlet var button: WKInterfaceButton!
  
  //定时器；
  var timer:NSTimer!
  
  //判断是开始还是结束轮播；
  var isStart:Bool = true
  
  //图片下标；
  var index:Int = 1
  
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  
  @IBAction func buttonClicked() {
    
    if(isStart){//开始滚动图片
      
      addTimer()
      button.setTitle("结束")
      
    }else{//停止滚动图片
      self.timer.invalidate()
      self.timer = nil
      button.setTitle("开始")
      
    }
    
    isStart = !isStart
  }
  
  
  func addTimer(){   //图片轮播的定时器；
    self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "nextImage:", userInfo: nil, repeats: true)
  }
  
  
  
  func nextImage(sender:AnyObject!){
    
    let str = "img" + String(index)
    
    image.setImageNamed(str)
    
    index++
    if(index == 4){
      
      index = 1
    }
    
  }
  
  
  
  
  
}
