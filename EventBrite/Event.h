//
//  Event.h
//  EventBrite
//
//  Created by Sujit Anand on 4/21/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject{
    
}
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSDate *startDate;
@property(strong, nonatomic) NSString *imageURL;
@property(strong, nonatomic) NSString *description;
@property(strong, nonatomic) NSString *venueName;
@property(strong, nonatomic) NSString *venueAddress;
@property(strong, nonatomic) NSString *venueAddress2;
@property(strong, nonatomic) NSString *venueCity;
@property NSUInteger eventId;
-(id)initWithEvent:(NSString *)titleString StartDate:(NSDate *)startDate andImageURL:(NSString *)imageURL andDescription:(NSString *)description andVenueName:(NSString *)venueName andVenueAddress:(NSString *)VenueAddress andVenueAddress2:(NSString *)VenueAddress2 venueCity:(NSString *)venueCity;
@end
