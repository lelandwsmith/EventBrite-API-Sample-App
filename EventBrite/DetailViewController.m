//
//  DetailViewController.m
//  EventBrite
//
//  Created by Sujit Anand on 4/25/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize event,navBar,backButton,venueName,address2Label,addressLabel,cityLabel,Titlelabel,displayImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil event:(Event *) event
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.event = event;
        
        
        
              
    }
    return self;
}

-(IBAction)goBack:(id)sender{
    
    EventViewController *eventVC = [[EventViewController alloc] initWithNibName:@"EventList" bundle:nil];
    [self presentViewController:eventVC animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.event.title);
   
    NSString *imgUrl = event.imageURL;
    NSURL *url = [NSURL URLWithString:imgUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *newImage = [UIImage imageWithData:imageData];
    
    self.Titlelabel.text = self.event.title;
    self.Titlelabel.minimumScaleFactor = 0.5;
    self.Titlelabel.numberOfLines = 1;
    self.Titlelabel.adjustsFontSizeToFitWidth = YES;
   
    
    self.venueName.text = self.event.venueName;
    self.venueName.minimumScaleFactor = 0.1;
    self.venueName.numberOfLines = 1;
    self.venueName.adjustsFontSizeToFitWidth = YES;
   
    
    self.addressLabel.text = self.event.venueAddress;
    self.addressLabel.minimumScaleFactor = 0.1;
    self.addressLabel.numberOfLines = 1;
    self.addressLabel.adjustsFontSizeToFitWidth = YES;
    
    
    self.address2Label.text = self.event.venueAddress2;
    self.address2Label.minimumScaleFactor = 0.1;
    self.address2Label.numberOfLines = 1;
    self.address2Label.adjustsFontSizeToFitWidth = YES;
   
    
    self.cityLabel.text = self.event.venueCity;
    self.cityLabel.minimumScaleFactor = 0.1;
    self.cityLabel.numberOfLines = 1;
    self.cityLabel.adjustsFontSizeToFitWidth = YES;
    
    
    self.displayImage.image = newImage;
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
