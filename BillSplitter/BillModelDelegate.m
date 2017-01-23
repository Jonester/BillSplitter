//
//  BillModelDelegate.m
//  BillSplitter
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "BillModelDelegate.h"
#import "BillModel.h"

@implementation BillModelDelegate

-(NSString *)calculateSplitAmount:(NSString *)bill numberPeople:(NSString *)people taxPercentage:(NSString *)tax {
    
    BillModel *billModel = [BillModel new];
    self.billDelegate = billModel;
    return [billModel calculateSplitAmount:bill numberPeople:people taxPercentage:tax];
    
}

@end

