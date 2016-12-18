//
//  ViewController.m
//  MeasurNetTools
//
//  Created by jordan on 16/12/18.
//  Copyright © 2016年 jordan. All rights reserved.
//

#import "ViewController.h"
#import "MeasurNetTools.h"
#import "QBTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(IBAction)buttonClick:(id)sender
{
    MeasurNetTools * meaurNet = [[MeasurNetTools alloc] initWithblock:^(float speed) {
        NSString* speedStr = [NSString stringWithFormat:@"%@/S", [QBTools formattedFileSize:speed]];
        NSLog(@"即时速度:speed:%@",speedStr);
    } finishMeasureBlock:^(float speed) {
        NSString* speedStr = [NSString stringWithFormat:@"%@/S", [QBTools formattedFileSize:speed]];
        NSLog(@"平均速度为：%@",speedStr);
        NSLog(@"相当于带宽：%@",[QBTools formatBandWidth:speed]);
    } failedBlock:^(NSError *error) {
        
    }];
    
    [meaurNet startMeasur];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
