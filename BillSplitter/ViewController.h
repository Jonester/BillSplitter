//
//  ViewController.h
//  BillSplitter
//
//  Created by Chris Jones on 2017-01-22.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BillDelegate <NSObject>

-(NSString *)calculateSplitAmount:(NSString *)bill numberPeople:(NSString *)people taxPercentage:(NSString *)tax;

@end

@interface ViewController : UIViewController


@end

