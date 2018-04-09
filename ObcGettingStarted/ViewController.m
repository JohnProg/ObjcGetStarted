//
//  ViewController.m
//  ObcGettingStarted
//
//  Created by John Paul Machahuay on 4/8/18.
//  Copyright © 2018 John Paul Machahuay. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray<Course *> *courses;
@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCourses];
    // Styling the navBar
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    [self.tableView registerClass: UITableViewCell.class forCellReuseIdentifier: cellId];
}

- (void) setupCourses {
    self.courses = NSMutableArray.new;
    // Populate Date
    Course *course1 = Course.new;
    course1.name = @"Course of HTML";
    course1.numberOfLessons = @20;
    [self.courses addObject: course1];
    
    Course *course2 = Course.new;
    course2.name = @"Course of CSS";
    course2.numberOfLessons = @3;
    [self.courses addObject: course2];
    
    Course *course3 = Course.new;
    course3.name = @"Course of JS";
    course3.numberOfLessons = @7;
    [self.courses addObject: course3];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId forIndexPath:indexPath];
    cell.backgroundColor = UIColor.redColor;
    
    Course *course = self.courses[indexPath.row];
    cell.textLabel.text = [[course.name stringByAppendingString: @" Lessons: "] stringByAppendingFormat: @"%@", course.numberOfLessons];
    return cell;
}

@end
