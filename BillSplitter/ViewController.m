//
//  ViewController.m
//  BillSplitter
//
//  Created by Chris Jones on 2017-01-22.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *taxPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitAmountLabel;

@property (weak, nonatomic) id<BillDelegate> delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.splitAmountLabel.text = [self.delegate calculateSplitAmount:self.billAmountTextField.text
                                                        numberPeople:self.numberOfPeopleLabel.text
                                                       taxPercentage:self.taxPercentageLabel.text];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberOfPeople:(UISlider *)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    
}

- (IBAction)taxPercentage:(UISlider *)sender {
    self.taxPercentageLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

@end
