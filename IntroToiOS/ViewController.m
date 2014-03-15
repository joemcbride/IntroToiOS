//
//  ViewController.m
//  IntroToiOS
//
//  Created by Joseph McBride on 2/18/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error;
    
    NSString *file = [[NSBundle bundleForClass:[self class]] pathForResource:@"person" ofType:@"json"];
    NSAssert(file != nil, @"File should not be nil.");
    
    NSString *fileData = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];
    
	// get json data from a url
//    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/databases/DBName/docs/person/38a6e3a2-3140-465d-b01d-60fc6ebe3502"];
//    NSString *fileData = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    if(error) {
        NSLog(@"File read error:\n%@", [error description]);
        return;
    }
    
    People *people = [People new];
    
    Person *person = [people loadPerson:fileData];
    if(person) {
        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
        
        NSMutableString *address = [[NSMutableString alloc] initWithString:person.address.line1];
        [address appendFormat:@"\n%@", person.address.city];
        [address appendFormat:@" %@", person.address.state];
        [address appendFormat:@", %@", person.address.zip];
        
        NSLog(@"address:\n%@", address);
        
        self.addressLabel.text = address;
    }
}

- (void)viewDidLayoutSubviews {
    self.addressLabel.numberOfLines = 0;
    [self.addressLabel sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
