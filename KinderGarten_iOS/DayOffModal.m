//
//	RootClass.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DayOffModal.h"

@implementation DayOffModal




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"beginTime"] isKindOfClass:[NSNull class]]){
		self.beginTime = dictionary[@"beginTime"];
	}	
	if(![dictionary[@"briefReason"] isKindOfClass:[NSNull class]]){
		self.briefReason = dictionary[@"briefReason"];
	}	
	if(![dictionary[@"class"] isKindOfClass:[NSNull class]]){
		self.classId = dictionary[@"class"];
	}	
	if(![dictionary[@"classInfo"] isKindOfClass:[NSNull class]]){
		self.classInfo = [[ClassInfo alloc] initWithDictionary:dictionary[@"classInfo"]];
	}

	if(![dictionary[@"endTime"] isKindOfClass:[NSNull class]]){
		self.endTime = dictionary[@"endTime"];
	}	
	if(![dictionary[@"reason"] isKindOfClass:[NSNull class]]){
		self.reason = dictionary[@"reason"];
	}	
	if(![dictionary[@"student"] isKindOfClass:[NSNull class]]){
		self.student = dictionary[@"student"];
	}	
	if(![dictionary[@"user"] isKindOfClass:[NSNull class]]){
		self.user = dictionary[@"user"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.beginTime != nil){
		dictionary[@"beginTime"] = self.beginTime;
	}
	if(self.briefReason != nil){
		dictionary[@"briefReason"] = self.briefReason;
	}
	if(self.class != nil){
		dictionary[@"class"] = self.class;
	}
	if(self.classInfo != nil){
		dictionary[@"classInfo"] = [self.classInfo toDictionary];
	}
	if(self.endTime != nil){
		dictionary[@"endTime"] = self.endTime;
	}
	if(self.reason != nil){
		dictionary[@"reason"] = self.reason;
	}
	if(self.student != nil){
		dictionary[@"student"] = self.student;
	}
	if(self.user != nil){
		dictionary[@"user"] = self.user;
	}
	return dictionary;

}
@end