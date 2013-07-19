//
//  RootViewController.h
//  EventBrite
//
//  Created by Sujit Anand on 4/18/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "EventViewController.h"
@interface RootViewController : UIViewController{
    UIViewController *rootViewController;
    NSArray *myImages;
    NSTimer *timer;
    UIImageView *imageView;
    IBOutlet UIView *welcomeMessageView;
    UILabel *welComeLabel;
    IBOutlet UIButton *lookForEvents;
   
    

}

@property (strong,nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) IBOutlet UIView *welcomeMessageView;
@property (strong,nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong ,nonatomic) IBOutlet UIButton *lookForEvents;



-(UIViewController *)getRootViewController;
-(void)goToNextView;


@end
