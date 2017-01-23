//
//  BillModelDelegate.h
//  BillSplitter
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BillDelegate <NSObject>

-(NSString *)calculateSplitAmount:(NSString *)bill numberPeople:(NSString *)people taxPercentage:(NSString *)tax;

@end

@interface BillModelDelegate : NSObject

@property (weak, nonatomic) id<BillDelegate> billDelegate;

-(NSString *)calculateSplitAmount:(NSString *)bill numberPeople:(NSString *)people taxPercentage:(NSString *)tax;

@end
