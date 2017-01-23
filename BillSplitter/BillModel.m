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

    
    if([bill integerValue] && [people integerValue] && [tax integerValue])  {
        NSNumberFormatter *currencyFormat = [NSNumberFormatter new];
        [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
        float calculateAmount = [bill floatValue] * (([tax floatValue]/100) + 1) / [people floatValue];
        self.splitAmount = @(calculateAmount);
        return [currencyFormat stringFromNumber:self.splitAmount];
    } else {
        return nil;
    }
}

@end
