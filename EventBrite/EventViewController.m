//
//  EventViewController.m
//  EventBrite
//
//  Created by Sujit Anand on 4/20/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

@synthesize eventTableView,navBar,xmlEvents;//eventDetailViewController;//


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    xmlEvents = [[XMLParser alloc] initwithXMLbyURL:@"https://www.eventbrite.com/xml/event_search?app_key=GFO6E7JWAQYASNDWAN"];
        
    

    
    
}

	

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.xmlEvents.eventList count];
   
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
       return 70.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    Event *event;
    event = [xmlEvents.eventList objectAtIndex:indexPath.row];
    

     NSString *imgUrl = event.imageURL;
    NSURL *url = [NSURL URLWithString:imgUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *newImage = [UIImage imageWithData:imageData];
    
    
    cell.textLabel.text = event.title;
    cell.detailTextLabel.text = event.description;
    
    NSLog(@"%@",event.description);
    
   
    
    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    [newImage drawInRect:CGRectMake(0, 0, 100, 100)];
    newImage  = UIGraphicsGetImageFromCurrentImageContext();
    cell.imageView.image  = newImage;
    UIGraphicsEndImageContext();
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  
    DetailViewController *dvController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil event:[xmlEvents.eventList objectAtIndex:indexPath.row]];
   
    
    [self presentViewController:dvController animated:YES completion:nil];
  
    
    
}
//
//-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    
//   
//}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
      
      

@end
