//
//  DetailViewController.h
//  EventBrite
//
//  Created by Sujit Anand on 4/25/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "EventViewController.h"
@interface DetailViewController : UIViewController
{

    NSString *testString;
    Event *event;
    IBOutlet UIButton *backButton;
    
}
@property (strong,nonatomic) Event *event;
@property (strong, nonatomic) IBOutlet UILabel *Titlelabel,*addressLabel,*address2Label,*cityLabel,*venueName;
@property (strong,nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong,nonatomic) IBOutlet UIButton *backButton;
@property (strong,nonatomic) IBOutlet UIImageView *displayImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil event:(Event *) event;

-(IBAction)goBack:(id)sender;
@end
