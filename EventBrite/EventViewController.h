//
//  EventViewController.h
//  EventBrite
//
//  Created by Sujit Anand on 4/20/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "DetailViewController.h"




@interface EventViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UINavigationBar *navBar;
    IBOutlet UITableView *eventTableView;
    
    
}


@property (strong,nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong,nonatomic) IBOutlet UITableView *eventTableView;
@property (strong,nonatomic) XMLParser *xmlEvents;



@end
