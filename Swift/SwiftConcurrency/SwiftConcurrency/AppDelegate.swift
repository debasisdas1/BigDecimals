//
//  AppDelegate.swift
//  SwiftConcurrency
//
//  Created by Debasis Das on 6/11/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
//        self.testPrintMethods()
//        self.queueTest1()
//        self.queueTest2()
//        self.queueTest3()
//        self.queueTest4()
//        self.queueTest5()
//        self.queueTest6()
        self.queueTest9()
    }
    
    //The below methods prints the thread on which they are being executed Main Thread or Background?
        func printApples(){
            print("printApples is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
            for i in 0..<3{
                print("🍏\(i)")
            }
        }
        
        func printStrawberries(){
            print("printStrawberries is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
            for i in 0..<3{
                print("🍓\(i)")
            }
        }
        
        func printBalls(){
            print("printBalls is running on = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
            for i in 0..<3{
                print("🎱\(i)")
            }
        }
    
    
        func testPrintMethods(){
            printApples()
            printStrawberries()
            printBalls()
        }
    
    
    func queueTest1(){
            let queue = DispatchQueue(label: "com.bigdecimals.queue1")
            queue.async {
                self.printApples()
            }
            queue.async {
                self.printStrawberries()
            }
            queue.async {
                self.printBalls()
            }
            
        }

    
    func queueTest2(){
            let queue1 = DispatchQueue(label: "com.bigdecimals.queue1")
            let queue2 = DispatchQueue(label: "com.bigdecimals.queue2")
            let queue3 = DispatchQueue(label: "com.bigdecimals.queue3")
            queue1.async {
                self.printApples()
            }
            queue2.async {
                self.printStrawberries()
            }
            queue3.async {
                self.printBalls()
            }
            
        }
    
    func queueTest3(){
            let queue1 = DispatchQueue(label: "com.bigdecimals.queue1")
            let queue2 = DispatchQueue(label: "com.bigdecimals.queue2")
            let queue3 = DispatchQueue(label: "com.bigdecimals.queue3")
            queue1.sync {
                self.printApples()
            }
            queue2.async {
                self.printStrawberries()
            }
            queue3.async {
                self.printBalls()
            }
        }
    
    func queueTest4(){
            let globalQueue = DispatchQueue.global()
            globalQueue.async {
                self.printApples()
            }
            globalQueue.async {
                self.printStrawberries()
            }
            globalQueue.async {
                self.printBalls()
            }

        }
    
    func queueTest5(){
            let globalQueue = DispatchQueue.global()
            globalQueue.sync {
                self.printApples()
            }
            globalQueue.async {
                self.printStrawberries()
            }
            globalQueue.async {
                self.printBalls()
            }
            
        }
    
    func queueTest6(){
            let mainQueue = DispatchQueue.main
            mainQueue.async {
                self.printApples()
            }
            
            mainQueue.async {
                self.printStrawberries()
            }
            mainQueue.async {
                self.printBalls()
            }
        }
    
    func queueTest9(){
            let queue1 = DispatchQueue(label: "com.knowstack.queue1", qos:.utility, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
            let queue2 = DispatchQueue(label: "com.knowstack.queue1", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
            
            queue1.asyncAfter(deadline: .now()+5.0) {
                print("In Print Strawberries = \(Date())")
                self.printStrawberries()
                
            }
            
            queue2.async {
                print("In Print Balls = \(Date())")
                self.printBalls()
                
            }
        }

}

