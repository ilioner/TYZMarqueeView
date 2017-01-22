//
//  ViewController.m
//  TYZMarqueeView
//
//  Created by Tywin on 2017/1/22.
//  Copyright © 2017年 Tywin. All rights reserved.
//

#import "ViewController.h"

#import "TYZMarqueeView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *dataArray = @[@"11111",@"22222",@"3333",@"4444",@"5555",@"6666",@"7777",@"8888",@"9999",@"0000"].mutableCopy;
    TYZMarqueeView *__view = [[TYZMarqueeView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) withDataArray:dataArray];
    __view.clipsToBounds = YES;
    [self.view addSubview:__view];
    __view.onclick = ^(NSInteger index, id obj){
        NSLog(@"index -----> %ld",index);
        NSLog(@"obj-----> %@",obj);
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
