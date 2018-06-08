//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Zhenyao Cai on 6/7/18.
//  Copyright © 2018 Zhenyao Cai. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController ()<CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;


@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled=NO;
    self.req=[[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled=YES;
    
    double inputValue = [self.inputField.text floatValue];
    double euroValue = inputValue * currencies.EUR;
    
    NSString *temp = [NSString stringWithFormat: @"%.2f", euroValue];
    
    double cnyValue = inputValue * currencies.CNY;
    
    NSString *temp2 = [NSString stringWithFormat: @"%.2f", cnyValue];
    
    double jpyValue = inputValue * currencies.JPY;
    
    NSString *temp3 = [NSString stringWithFormat: @"%.2f", jpyValue];
    
    self.currencyA.text=temp;
    self.currencyB.text=temp2;
    self.currencyC.text=temp3;
    
    
}
@end
