//
//  ARViewController.m
//  ARFormValidator
//
//  Created by Alex M Reynolds on 09/28/2015.
//  Copyright (c) 2015 Alex M Reynolds. All rights reserved.
//

#import "ARViewController.h"
#import "ARFormValidator.h"
@interface ARViewController ()
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, strong) UITextView *txview;

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ARFormValidator *fv = [[ARFormValidator alloc] init];
    _txview = [[UITextView alloc] init];
    _txview.text = @"farts";
    _field = [[UITextField alloc] init];
    _field.text = @"too";
    
    NSError *validatorError = nil;
    
    [fv addField:_field validationBlock:^BOOL(id field, NSError *__autoreleasing *error) {
        UITextField *test = field;
        if(test.text.length){
            return YES;
        }else {
            if(error){
                *error = [NSError errorWithDomain:@"com.ARFormValidator" code:101 userInfo:@{NSLocalizedDescriptionKey: @"field must be logner"}];
            }
            return NO;
        }
    }];
    [fv addField:_txview validationBlock:^BOOL(id field, NSError *__autoreleasing *error) {
        UITextView *test = field;
        if(test.text.length){
            return YES;
        }else {
            if(error){
                *error = [NSError errorWithDomain:@"com.ARFormValidator" code:101 userInfo:@{NSLocalizedDescriptionKey: @"view must be longer"}];
            }
            return NO;
        }
    }];
    BOOL valid = [fv validate:&validatorError];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
