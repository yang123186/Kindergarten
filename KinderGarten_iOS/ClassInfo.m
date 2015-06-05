//
//	ClassInfo.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ClassInfo.h"

@interface ClassInfo ()
@end
@implementation ClassInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"code"] isKindOfClass:[NSNull class]]){
		self.code = dictionary[@"code"];
	}	
	if(![dictionary[@"grade"] isKindOfClass:[NSNull class]]){
		self.grade = dictionary[@"grade"];
	}	
	if(![dictionary[@"intro"] isKindOfClass:[NSNull class]]){
		self.intro = dictionary[@"intro"];
	}	
	if(![dictionary[@"kindergarten"] isKindOfClass:[NSNull class]]){
		self.kindergarten = dictionary[@"kindergarten"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[@"code"] = self.code;
	}
	if(self.grade != nil){
		dictionary[@"grade"] = self.grade;
	}
	if(self.intro != nil){
		dictionary[@"intro"] = self.intro;
	}
	if(self.kindergarten != nil){
		dictionary[@"kindergarten"] = self.kindergarten;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	return dictionary;

}
@end