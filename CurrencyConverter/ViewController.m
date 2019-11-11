//
//  ViewController.m
//  CurrencyConverter
//
//  Created by April Polubiec on 4/28/19.
//  Copyright © 2019 April Polubiec. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController  ()<CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest* req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currency1;
@property (weak, nonatomic) IBOutlet UILabel *currency2;
@property (weak, nonatomic) IBOutlet UILabel *currency3;


@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    
    self.req.delegate = self;
    [self.req start];
    

}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
        self.convertButton.enabled = YES;
    
    
    double inputValue = [self.inputField.text floatValue];
    double PLNValue = inputValue * currencies.PLN;
    double EURValue = inputValue * currencies.EUR;
    double CZKValue = inputValue * currencies.CZK;
    NSString* PLNstr = [NSString stringWithFormat:@"%.2f",
                      PLNValue];
    NSString* EURstr = [NSString stringWithFormat:@"%.2f",
                      EURValue];
    NSString* CZKstr = [NSString stringWithFormat:@"%.2f",
                      CZKValue];
    
    self.currency1.text = PLNstr;
    self.currency2.text = EURstr;
    self.currency3.text = CZKstr;
}


@end
