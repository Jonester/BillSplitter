//
//  BillModel.m
//  BillSplitter
//
//  Created by Chris Jones on 2017-01-22.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "BillModel.h"

@interface BillModel()

@property (nonatomic) NSNumber *splitAmount;

@end

@implementation BillModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _splitAmount = [NSNumber new];
    }
    return self;
}

-(NSString *)calculateSplitAmount:(NSString *)bill numberPeople:(NSString *)people taxPercentage:(NSString *)tax{
    
//    ViewController *viewController = [ViewController new];
//    viewController.billDelegate = self;
    
    if([bill integerValue]) {
        NSNumberFormatter *currencyFormat = [NSNumberFormatter new];
        [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
        self.splitAmount = @(([bill integerValue] * ([tax integerValue]/100) + 1) / [people integerValue]);
        return [currencyFormat stringFromNumber:self.splitAmount];
    } else {
        return nil;
    }
}

@end
