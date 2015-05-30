//
//  RichLabel.m
//  KinderGarten_iOS
//
//  Created by Rdd7 on 5/24/15.
//  Copyright (c) 2015 Rdd7. All rights reserved.
//

#import "RichLabel.h"
#import "General.h"
@interface RichLabel()

@property (nonatomic, retain) NSLayoutManager *layoutManager;
@property (nonatomic, retain) NSTextContainer *textContainer;
@property (nonatomic, retain) NSTextStorage *textStorage;


@property (nonatomic, strong) NSMutableArray *linkRanges;


@property (nonatomic, assign) BOOL isTouchMoved;

@property (nonatomic, assign) NSRange selectedRange;

@property (nonatomic,strong)  NSMutableArray *userRanges;

@property   (nonatomic,assign)  CGFloat width;

@end

@implementation RichLabel

- (instancetype)initWithWidth:(CGFloat)width
{
    if(self = [super init]){
        self.width=width;
        self.userRanges=[[NSMutableArray alloc]initWithCapacity:0];
        [self setupTextSystem];
    }
    return self;
}


- (void)setText:(NSString *)text
{
//    [super setText:text];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                         attributes:[self attributesFromProperties]];
    [self updateTextStoreWithAttributedString:attributedText];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedText];
    [mutableAttributeString addAttributes:[self attributesFromProperties] range:NSMakeRange(0, mutableAttributeString.length)];
    [self updateTextStoreWithAttributedString:mutableAttributeString];
}


- (void)setupTextSystem
{
    self.textContainer = [[NSTextContainer alloc] init];
    self.textContainer.lineFragmentPadding = 0;
    self.textContainer.maximumNumberOfLines = 0;//no limit
    self.textContainer.lineBreakMode = NSLineBreakByWordWrapping;//self.lineBreakMode;
    self.textContainer.size = CGSizeMake(self.width,MAXFLOAT);
    
    self.layoutManager = [[NSLayoutManager alloc] init];
    self.layoutManager.delegate = self;
    [self.layoutManager addTextContainer:self.textContainer];
    
    [self.textContainer setLayoutManager:self.layoutManager];
    
    self.userInteractionEnabled = YES;
    
    
    
    [self updateTextStoreWithText];
    //默认的回调
    self.linkTapHandler = ^(RichLabelLinkType linkType, NSString *string, NSRange range) {
        if(linkType==LinkTypeUserURL){
            DLog(@"UserInfo touched,link is %@",string);
        }
        else{
            DLog(@"other,may be phone");
        }
    };
}







/*
 * linkType : 链接类型
 * range    : 链接区域
 * link     : 链接文本
 */
- (NSDictionary *)getLinkAtLocation:(CGPoint)location
{
    // Do nothing if we have no text
    if (self.textStorage.string.length == 0)
    {
        return nil;
    }
    
    // Work out the offset of the text in the view
    CGPoint textOffset;
    NSRange glyphRange = [self.layoutManager glyphRangeForTextContainer:self.textContainer];
    textOffset = [self calcTextOffsetForGlyphRange:glyphRange];
    
    // Get the touch location and use text offset to convert to text cotainer coords
    location.x -= textOffset.x;
    location.y -= textOffset.y;
    
    NSUInteger touchedChar = [self.layoutManager glyphIndexForPoint:location inTextContainer:self.textContainer];
    
    // If the touch is in white space after the last glyph on the line we don't
    // count it as a hit on the text
    NSRange lineRange;
    CGRect lineRect = [self.layoutManager lineFragmentUsedRectForGlyphAtIndex:touchedChar effectiveRange:&lineRange];
    if (CGRectContainsPoint(lineRect, location) == NO)
    {
        return nil;
    }
    
    // Find the word that was touched and call the detection block
    for (NSDictionary *dictionary in self.linkRanges)
    {
        NSRange range = [[dictionary objectForKey:@"range"] rangeValue];
        
        if ((touchedChar >= range.location) && touchedChar < (range.location + range.length))
        {
            return dictionary;
        }
    }
    
    return nil;
}

// Applies background color to selected range. Used to hilight touched links
- (void)setSelectedRange:(NSRange)range
{
    //delete selected color when finger has touched up
    if (self.selectedRange.length && !NSEqualRanges(self.selectedRange, range)) {
        [self.textStorage removeAttribute:NSBackgroundColorAttributeName
                                    range:self.selectedRange];
        [self.textStorage addAttribute:NSForegroundColorAttributeName
                                 value:BLUE_LINK_COLOR
                                 range:self.selectedRange];
    }
    
    //draw highlight color
    if (range.length) {
        [self.textStorage addAttribute:NSBackgroundColorAttributeName
                                 value:GRAY_HIGHLIGHT_LINK_BACKGROUND_COLOR
                                 range:range];
        [self.textStorage addAttribute:NSForegroundColorAttributeName
                                 value:BLUE_LINK_COLOR
                                 range:range];
    }
    _selectedRange = range;
    [self setNeedsDisplay];
}


- (void)updateTextStoreWithText
{
    if (self.attributedText)
    {
        NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [mutableAttributeString addAttributes:[self attributesFromProperties] range:NSMakeRange(0, mutableAttributeString.length)];
        [self updateTextStoreWithAttributedString:mutableAttributeString];
    }
    else if (self.text)
    {
        [self updateTextStoreWithAttributedString:[[NSAttributedString alloc] initWithString:self.text attributes:[self attributesFromProperties]]];
    }
    else
    {
        [self updateTextStoreWithAttributedString:[[NSAttributedString alloc] initWithString:@"" attributes:[self attributesFromProperties]]];
    }
    [self setNeedsDisplay];
}




- (void)updateTextStoreWithAttributedString:(NSAttributedString *)attributedString
{
    self.textContainer.size = self.frame.size;

    if (attributedString.length != 0){
        attributedString = [RichLabel sanitizeAttributedString:attributedString];
    }
    
    if (attributedString.length != 0) {
        //获取所有类型的链接
        self.linkRanges = [self getRangesForLinks:attributedString];
        //对所有连接添加链接属性
        attributedString = [self addLinkAttributesToAttributedString:attributedString linkRanges:self.linkRanges];
    } else {
        self.linkRanges = nil;
    }
    
    if (self.textStorage) {
        [self.textStorage setAttributedString:attributedString];
    } else {
        self.textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedString];
        [self.textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager setTextStorage:self.textStorage];
    }
}
/*
 * 链接文本属性
 */
- (NSAttributedString *)addLinkAttributesToAttributedString:(NSAttributedString *)string linkRanges:(NSArray *)linkRanges
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:string];
    
    NSDictionary *attributes = @{
                                  NSForegroundColorAttributeName : BLUE_LINK_COLOR
                                };
    
    for (NSDictionary *dictionary in linkRanges)
    {
        NSRange range = [[dictionary objectForKey:@"range"] rangeValue];
        [attributedString addAttributes:attributes range:range];
    }
    return attributedString;
}



- (NSDictionary *)attributesFromProperties
{
    //阴影属性
    NSShadow *shadow = [[NSShadow alloc] init];
    if (self.shadowColor){
        shadow.shadowColor = self.shadowColor;
        shadow.shadowOffset = self.shadowOffset;
    } else {
        shadow.shadowOffset = CGSizeMake(0, -1);
        shadow.shadowColor = nil;
    }
    
    //颜色属性
    UIColor *color = self.textColor;
    if (!self.isEnabled){
        color = [UIColor lightGrayColor];
    } else if (self.isHighlighted) {
        color = self.highlightedTextColor;
    }
    
    //段落属性
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = self.textAlignment;
    
    //属性字典
    NSDictionary *attributes = @{
                                 NSFontAttributeName : self.font,
                                 NSForegroundColorAttributeName : color,
                                 NSShadowAttributeName : shadow,
                                 NSParagraphStyleAttributeName : paragraph
                                 };
    return attributes;
}



/*
 * 修正换行模式
 */
+ (NSAttributedString *)sanitizeAttributedString:(NSAttributedString *)attributedString
{
    NSRange range;
    NSParagraphStyle *paragraphStyle = [attributedString attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:&range];
    
    if (paragraphStyle == nil)
    {
        return attributedString;
    }
    
    // Remove the line breaks
    NSMutableParagraphStyle *mutableParagraphStyle = [paragraphStyle mutableCopy];
    mutableParagraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    // Apply new style
    NSMutableAttributedString *restyled = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [restyled addAttribute:NSParagraphStyleAttributeName value:mutableParagraphStyle range:NSMakeRange(0, restyled.length)];
    
    return restyled;
}




- (NSMutableArray *)getRangesForLinks:(NSAttributedString *)text
{
    NSMutableArray *rangesForLinks = [[NSMutableArray alloc] init];

    [rangesForLinks addObjectsFromArray:[self getRangesForPhoneNumbers:text.string]];//seek for phone link
    
    [rangesForLinks addObjectsFromArray:self.userRanges];// add property of user info
    
    return rangesForLinks;
}


/*
 * 所有电话号码
 */
- (NSArray *)getRangesForPhoneNumbers:(NSString *)text
{
    NSMutableArray *rangesForPhoneNumbers = [[NSMutableArray alloc] init];;
    NSError *error = nil;
    NSDataDetector *detector = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    
    NSArray *matches = [detector matchesInString:text
                                         options:0
                                           range:NSMakeRange(0, text.length)];
    
    for (NSTextCheckingResult *match in matches)
    {
        NSRange matchRange = [match range];
        NSString *matchString = [text substringWithRange:matchRange];
        
        if ([match resultType] == NSTextCheckingTypePhoneNumber){
            [rangesForPhoneNumbers addObject:@{
                                                 @"linkType" : @(LinkTypePhoneNumber),
                                                 @"range"    : [NSValue valueWithRange:matchRange],
                                                 @"link"     : matchString
                                              }];
        }
    }
    return rangesForPhoneNumbers;
}


-(void)appendUserWithName:(NSString *)name UserLink:(NSString *)link{
    if(!name){
        name=@"！未找到用户！";
    }
    if (!link) {
        link=@"unknow link!!";
    }
    NSAttributedString *tmp_name=[[NSAttributedString alloc]initWithString:name];
    NSMutableAttributedString *attrStr;
    NSUInteger start=0;
    if(self.attributedText.length!=0){
        attrStr=[[NSMutableAttributedString alloc]initWithAttributedString: self.attributedText];
    }
    else{
        attrStr=[[NSMutableAttributedString alloc]init];
    }
    start=attrStr.length;
    [attrStr appendAttributedString:tmp_name];
    NSMutableArray *userInfoArray=[[NSMutableArray alloc]init];
    [userInfoArray addObject:@{
                              @"linkType" : @(LinkTypeUserURL),
                              @"range"    : [NSValue valueWithRange:NSMakeRange(start, name.length)],
                              @"link"     : [NSString stringWithFormat:@"User://%@",link]
                              }];
    [self.userRanges addObjectsFromArray:userInfoArray];

    self.attributedText=attrStr;
    
}


-(void)appendContent:(NSString *)content{
    NSAttributedString *tmp_content=[[NSAttributedString alloc]initWithString:content];
    NSMutableAttributedString *attrStr;
    if(self.attributedText.length!=0){
        attrStr=[[NSMutableAttributedString alloc]initWithAttributedString: self.attributedText];
    }
    else{
        attrStr=[[NSMutableAttributedString alloc]init];
    }
    [attrStr appendAttributedString:tmp_content];
    self.attributedText=attrStr;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Layout and Rendering
/*
 * 绘制文本相关方法
 */
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    // Use our text container to calculate the bounds required. First save our
    // current text container setup
    CGSize savedTextContainerSize = self.textContainer.size;
    NSInteger savedTextContainerNumberOfLines = self.textContainer.maximumNumberOfLines;
    
    // Apply the new potential bounds and number of lines
    self.textContainer.size = bounds.size;
    self.textContainer.maximumNumberOfLines = numberOfLines;
    
    // Measure the text with the new state
    CGRect textBounds;
    @try
    {
        NSRange glyphRange = [self.layoutManager glyphRangeForTextContainer:self.textContainer];
        textBounds = [self.layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:self.textContainer];
        
        // Position the bounds and round up the size for good measure
        textBounds.origin = bounds.origin;
        textBounds.size.width = ceilf(textBounds.size.width);
        textBounds.size.height = ceilf(textBounds.size.height);
    }
    @finally
    {
        // Restore the old container state before we exit under any circumstances
        self.textContainer.size = savedTextContainerSize;
        self.textContainer.maximumNumberOfLines = savedTextContainerNumberOfLines;
    }
    return textBounds;
}

- (void)drawTextInRect:(CGRect)rect
{
    // Don't call super implementation. Might want to uncomment this out when
    // debugging layout and rendering problems.
    //        [super drawTextInRect:rect];
    
    // Calculate the offset of the text in the view
    CGPoint textOffset;
    NSRange glyphRange = [self.layoutManager glyphRangeForTextContainer:self.textContainer];
    textOffset = [self calcTextOffsetForGlyphRange:glyphRange];
    
    // Drawing code
    [self.layoutManager drawBackgroundForGlyphRange:glyphRange atPoint:textOffset];
    [self.layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:textOffset];
}

// Returns the XY offset of the range of glyphs from the view's origin
- (CGPoint)calcTextOffsetForGlyphRange:(NSRange)glyphRange
{
    CGPoint textOffset = CGPointZero;
    
    CGRect textBounds = [self.layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:self.textContainer];
    CGFloat paddingHeight = (self.bounds.size.height - textBounds.size.height) / 2.0f;
    if (paddingHeight > 0)
    {
        textOffset.y = paddingHeight;
    }
    
    return textOffset;
}
#pragma mark - Layout manager delegate


/*
 * 触摸事件
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.isTouchMoved = NO;
    
    CGPoint touchLocation = [[touches anyObject] locationInView:self];
    NSDictionary *touchedLink = [self getLinkAtLocation:touchLocation];
    
    if (touchedLink){
        self.selectedRange = [[touchedLink objectForKey:@"range"]rangeValue];
    } else {
        [super touchesBegan:touches withEvent:event];
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    self.isTouchMoved = YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    //如果拖动手指的话就不识别
    if (self.isTouchMoved) {
        self.selectedRange = NSMakeRange(0, 0);
        return;
    }
    
    CGPoint touchLocation = [[touches anyObject] locationInView:self];
    NSDictionary *touchedLink = [self getLinkAtLocation:touchLocation];
    
    if (touchedLink){
        NSRange range = [[touchedLink objectForKey:@"range"] rangeValue];
        NSString *touchedSubstring = [touchedLink objectForKey:@"link"];
        RichLabelLinkType linkType = (RichLabelLinkType)[[touchedLink objectForKey:@"linkType"] intValue];
        
        self.linkTapHandler(linkType, touchedSubstring, range);
    } else {
        [super touchesBegan:touches withEvent:event];
    }
    self.selectedRange = NSMakeRange(0, 0);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.selectedRange = NSMakeRange(0, 0);
}
@end
