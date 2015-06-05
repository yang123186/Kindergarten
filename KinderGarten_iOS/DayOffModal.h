#import <UIKit/UIKit.h>
#import "ClassInfo.h"

@interface DayOffModal : NSObject

@property (nonatomic, strong) NSString * beginTime;
@property (nonatomic, strong) NSString * briefReason;
@property (nonatomic, strong) NSString * classId;
@property (nonatomic, strong) ClassInfo * classInfo;
@property (nonatomic, strong) NSString * endTime;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) NSString * student;
@property (nonatomic, strong) NSString * user;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end