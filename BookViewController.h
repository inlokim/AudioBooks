//
//  BookViewController.h
//  TextAudioBooks
//
//  Created by 김인로 on 2016. 10. 3..
//  Copyright © 2016년 highwill. All rights reserved.
//

@import AVFoundation;

@interface BookViewController : UITableViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) NSIndexPath *contentsIndex;
@property (strong, nonatomic) NSMutableArray *contentsArray;


@end
