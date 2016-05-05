//
//  DetailViewController.m
//  JsonApi
//
//  Created by Elena Maso Willen on 05/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "DetailViewController.h"
#import "User.h"
#import "Adress.h"
#import "Company.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.fullNameLabel.text = self.userSelected.fullName;
    self.streetLabel.text = self.userSelected.fullAdress.street;
    self.suiteLabel.text = self.userSelected.fullAdress.suite;
    self.cityLabel.text = self.userSelected.fullAdress.city;
    self.zipcodeLabel.text = self.userSelected.fullAdress.zipcode;
    
    self.companyNameLabel.text = self.userSelected.companyInfo.name;
    self.companyCatchPhraseLabel.text = self.userSelected.companyInfo.catchPhrase;
    self.companyBsLabel.text = self.userSelected.companyInfo.bs;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
