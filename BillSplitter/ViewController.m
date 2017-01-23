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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (assign, nonatomic, readonly) CGFloat originalConstraint;

@end

@implementation ViewController
@synthesize billDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _originalConstraint = self.bottomConstraint.constant;
    
    NSNotificationCenter *nsNotificationCenter = [NSNotificationCenter defaultCenter];
    [nsNotificationCenter addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardDidHide:)];
    [self.view addGestureRecognizer:tapGesture];
    
}
-(void)keyboardDidHide:(UITapGestureRecognizer*)tapGesture {
    [self.billAmountTextField resignFirstResponder];
}

-(void)keyboardDidShow:(NSNotification*)nsNotification {
    NSValue *value = nsNotification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    CGFloat yPos = rect.origin.y;
    CGFloat screenHeight = self.view.bounds.size.height;
    
    if (screenHeight == yPos) {
        self.bottomConstraint.constant = self.originalConstraint;
    } else {
        self.bottomConstraint.constant = screenHeight - yPos + 10;
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)displaySplitAmount {
    self.splitAmountLabel.text = [self.billDelegate calculateSplitAmount:self.billAmountTextField.text
                                                        numberPeople:self.numberOfPeopleLabel.text
                                                       taxPercentage:self.taxPercentageLabel.text];
    
    
}



- (IBAction)numberOfPeople:(UISlider *)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self displaySplitAmount];
}

- (IBAction)taxPercentage:(UISlider *)sender {
    self.taxPercentageLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self displaySplitAmount];
}


@end
