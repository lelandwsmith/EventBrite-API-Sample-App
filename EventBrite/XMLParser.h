//
//  XMLParser.h
//  EventBrite
//
//  Created by Sujit Anand on 4/21/13.
//  Copyright (c) 2013 Sujit Anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface XMLParser : NSObject<NSXMLParserDelegate>{
    
        
    
    
       

}
@property (strong,nonatomic) NSMutableArray *eventList;
@property (strong,nonatomic) Event *currentevent;
@property (strong,nonatomic) NSXMLParser *parser;



-(id) initwithXMLbyURL:(NSString *) urlString;


@end
