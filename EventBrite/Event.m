//
//  Event.m
//  EventBrite
//
//  Created by Sujit Anand on 4/21/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import "Event.h"

@implementation Event {
    
}
@synthesize title,startDate,imageURL,eventId,description,venueAddress,venueAddress2,venueCity,venueName;//venue;//description;

-(id)initWithEvent:(NSString *)titleString StartDate:(NSDate *)startDate andImageURL:(NSString *)imageURL andDescription:(NSString *)description andVenueName:(NSString *)venueName andVenueAddress:(NSString *)VenueAddress andVenueAddress2:(NSString *)VenueAddress2 venueCity:(NSString *)venueCity;
{
    if(self = [super init])
    {
        self.title = titleString;
        self.startDate = startDate;
        self.imageURL = imageURL;
        self.description = description;
        self.venueAddress = VenueAddress;
        self.venueAddress2 = VenueAddress2;
        self.venueCity = venueCity;
        self.venueName = venueName;
        
    }
    
    
    return self;
}

@end
