//
//  ViewController.m
//  UI-KVO
//
//  Created by 吴胜杰 on 16/1/20.
//  Copyright © 2016年 wushengjie. All rights reserved.
//
/*
 KVO :key (键)--- Value（值） --- observer（观察者）

   键值观察者 
 通过对一个对象属性 或者变量 值的观察 来作出 对应的动作
  只要 key 对应的值发生改变 就会告诉观察者 新旧 指的改变
 通过 可以 来判断 是哪一个KVO 
 1.有一个观察者 观察的对象
 添加观察者 （可以给任意对象，一般对一个类）方法：被观察对象添加一个观察者
  [被观察者   addObserver: self forKeyPath:@“观察的 属性” options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil]
 
 2.只要值发生改变就去触发 告诉观察者 值发生改变 只要观察 的值 发生改变  就会 调用 这个方法
 KeyPath：观察的哪一个 属性
 ofObject：可以用于传值 （一般不用）
 change:里面是一个字典 包含 放生改变的 新值 和 旧值
 - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
 
 
 
 
 3.不再需要 观察这个对象的时候 就去移除 《不移除 就会崩溃》
 移除观察者
    [被观察者的对象  removeObserver:self forKeyPath:@“观察的 属性”]；
 */

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView  *scroll;
}
@end

@implementation ViewController
// 杨波
//真二
- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor orangeColor];
    scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scroll.backgroundColor = [UIColor brownColor];
    scroll.contentSize = CGSizeMake(0, 2000);
    
    
    [self.view addSubview:scroll];
   
    
//    观察 scroll的 里面的 scroll.contentOffset 的值是否发生改变
    [scroll addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    
    NSLog(@"%@  %@",keyPath,change);
    
    CGPoint changePoint = [change[@"new"] CGPointValue];
    CGFloat y = changePoint.y+64;
    NSLog(@"%f",1-y/100);
    self.navigationController.navigationBar.alpha = 1-y/100;
    
}
- (void)dealloc{
    [scroll removeObserver:self forKeyPath:@"contentOffset"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
