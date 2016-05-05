//
//  DetailViewController.h
//  JsonApi
//
//  Created by Elena Maso Willen on 05/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *suiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyCatchPhraseLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyBsLabel;

@property (strong, nonatomic) User *userSelected;

@end
