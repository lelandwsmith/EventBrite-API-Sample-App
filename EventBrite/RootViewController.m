//
//  RootViewController.m
//  EventBrite
//
//  Created by Sujit Anand on 4/18/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()


@end

@implementation RootViewController
@synthesize imageView,welcomeMessageView,welcomeLabel,lookForEvents;

-(id)init{

    self = [[RootViewController alloc] initWithNibName:@"iPhone" bundle:Nil];
    
    return self;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"iPhone" bundle:nil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;

    
    
    
    myImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"concertimage1.jpg"],[UIImage imageNamed:@"concertimages2.jpg"],[UIImage imageNamed:@"concertimage3.jpg"],[UIImage imageNamed:@"concertimage4.jpg"],nil];
    
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:imageView];
    welcomeMessageView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 100.0)];
    welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 50.0)];
    welcomeLabel.text = @"WELCOME TO THE APP!!";
    [welcomeLabel setBackgroundColor:[UIColor orangeColor]];
    welcomeLabel.textAlignment = 1;
    
    [welcomeMessageView addSubview:welcomeLabel];
    
    
    lookForEvents = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   
        
    lookForEvents.frame = CGRectMake((width/2)-15,(height-200) , 160, 60);
        [lookForEvents addTarget:self
               action:@selector(goToNextView)
     forControlEvents:UIControlEventTouchDown];
    
    [lookForEvents setTitle:@"LOOK FOR EVENTS" forState:UIControlStateNormal];
    
    
    [self.view addSubview:lookForEvents];

       
    
    
    [self.view addSubview:welcomeMessageView];
    
  
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
    [timer fire];
    
       
    NSLog(@"ViewDidload");
    
	// Do any additional setup after loading the view.
}

-(void)changeImage{
    static int i=0;
    
    if (i == [myImages count]){
        i=0;
    }
    [self.imageView setImage:myImages[i]];
    i++;
    
}

- (void)didReceiveMemoryWarning
{
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIViewController *)getRootViewController{

    //NSLog(@"ROOT VIEW");
    return rootViewController;
}
-(void)goToNextView{
    
    NSLog(@"Baversi");
    EventViewController *event = [[EventViewController alloc] initWithNibName:@"EventList" bundle:nil];
    [self presentViewController:event animated:YES completion:nil];
    //[self.presentingViewController   presentViewController:event animated:YES completion:nil];
    NSLog(@"Baversi1");
}

@end
