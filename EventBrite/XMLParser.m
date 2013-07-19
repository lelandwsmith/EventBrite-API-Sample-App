//
//  XMLParser.m
//  EventBrite
//
//  Created by Sujit Anand on 4/21/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import "XMLParser.h"
@implementation XMLParser

@synthesize eventList,parser,currentevent;


-(id) initwithXMLbyURL:(NSString *) urlString{
    
        
        eventList = [[NSMutableArray alloc] init];
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        parser = [[NSXMLParser alloc] initWithData:data];
        parser.delegate = self;
        [parser parse];

    
        
        
        return self;
    
}
NSString *currentKey;
NSMutableString *currentValue;

bool isVenue = NO;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    currentKey=nil;
    currentValue=nil;
    
    if([elementName isEqualToString:@"event"]){
        currentevent = [[Event alloc] init];
        return;
    }
    
    if([elementName isEqualToString:@"title"])
    {
      currentKey = @"title";
        return;
    }
    
    if([elementName isEqualToString:@"id"])
    {
        currentKey = @"id";
        return;
    }
    
    if([elementName isEqualToString:@"start_date"])
    {
        currentKey = @"start_date";
        return;
    }
    
    if([elementName isEqualToString:@"logo"])
    {
        currentKey = @"logo";
        return;
    }
    if ([elementName isEqualToString:@"description"]) {
        currentKey = @"description";
        return;
    }
    if ([elementName isEqualToString:@"venue"]) {
        isVenue = YES;
        return;
    }
    
    if([elementName isEqualToString:@"address"] && isVenue)
    {
        currentKey = @"address";
        return;
        
    }
    
    if([elementName isEqualToString:@"address_2"] && isVenue)
    {
        currentKey = @"address_2";
        return;
        
    }
    
    if([elementName isEqualToString:@"city"] && isVenue)
    {
        currentKey = @"city";
        return;
    }
    if([elementName isEqualToString:@"name"] && isVenue)
    {
        currentKey = @"name";
        return;
        
    }



}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if(currentKey){
        if(!currentValue){
            currentValue = [[NSMutableString alloc] init];
        }
        [currentValue appendString:string];
        //  NSLog(@"%@",currentValue);
    }
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
    if([elementName isEqualToString:@"event"])
    {
        [eventList addObject:currentevent];
        currentevent = nil;
    }
    
    if([elementName isEqualToString:@"title"])
    {
        NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentevent.title  = trimmed;

        return;
    }
   
if([elementName isEqualToString:@"id"])
{
    currentevent.eventId = [currentValue intValue];
     return;
}
    if ([elementName isEqualToString:@"description"]) {
        currentevent.description = currentValue;
        return;
    }
    if ([elementName isEqualToString:@"venue"]) {
        isVenue = NO;
        return;
    }

    if([elementName isEqualToString:@"address"] && isVenue)
    {
        NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentevent.venueAddress  = trimmed;

        return;

    }
    
    if([elementName isEqualToString:@"address_2"] && isVenue)
    {
        NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentevent.venueAddress2  = trimmed;

        return;
        
    }
    
    if([elementName isEqualToString:@"city"] && isVenue)
    {
        NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentevent.venueCity  = trimmed;

        return;
        
    }
    if([elementName isEqualToString:@"name"] && isVenue)
    {
       
        NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentevent.venueName  = trimmed;

        return;
        
    }
    
    
if([elementName isEqualToString:@"logo"])
{
    
    NSString *trimmed = [currentValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    currentevent.imageURL = trimmed;
    return;
}
if([elementName isEqualToString:@"start_date"])
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/YYYY hh:mm:ss"];
    currentevent.startDate = [df dateFromString:currentValue];

    
    return;
}
    


}



@end
