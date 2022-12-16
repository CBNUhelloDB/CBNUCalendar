-- user
INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('1', 'root', 'Lee SiHun', 'dkssu@naver.com', '1999-01-22', '3', 'Software');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('2', 'root', 'Yoo JungHoon', 'bonghoon@naver.com', '2000-05-12', '4', 'Electronic');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('3', 'root', 'An TaeEn', 'galsa@naver.com', '1998-07-19', '4', 'Art');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('4', 'root', 'Yoon SangIl', 'mixyu@naver.com', '2002-12-26', '1', 'Math');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('5', 'root', 'Gwak JunHyuk', 'fifa@naver.com', '2003-01-19', '1', 'Software');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('6', 'root', 'Bang SangHyun', 'BBaeU@naver.com', '2001-07-01', '2', 'Art');

INSERT INTO `events_calendar`.`user` (`id`, `password`, `full_name`, `email`, `birthdate`, `grade`, `department`)
VALUES ('7', 'root', 'Noh GyungYeon', 'NGYProf@naver.com', '1998-05-20', '4', 'Math');

-- club
INSERT INTO `events_calendar`.`club` (`name`, `manager_id`, `open_date`)
VALUES ('BINS', '1', '2017-03-02');

INSERT INTO `events_calendar`.`club` (`name`, `manager_id`, `open_date`)
VALUES ('FIFA', '3', '2017-03-02');

INSERT INTO `events_calendar`.`club` (`name`, `manager_id`, `open_date`)
VALUES ('MathMatics', '4', '2017-03-02');

INSERT INTO `events_calendar`.`club` (`name`, `manager_id`, `open_date`)
VALUES ('Actor', '6', '2017-03-02');

-- club member
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('1', '1', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('2', '1', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('3', '2', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('5', '2', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('1', '2', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('7', '3', '2017-03-02');
INSERT INTO `events_calendar`.`club_member` (`user_id`, `club_id`, `join_date`)
VALUES ('6', '4', '2017-03-02');

-- location
INSERT INTO `events_calendar`.`location` (`name`, `subtitle`, `address`, `capacity`, `phone_num`)
VALUES ('ROADKING', 'Western Style Pub', 'Middle Door', '100', '043-111-1111');
INSERT INTO `events_calendar`.`location` (`name`, `subtitle`, `address`, `capacity`, `phone_num`)
VALUES ('Auditorium', 'Concert Hall', 'Western Door', '300', '043-222-2222');
INSERT INTO `events_calendar`.`location` (`name`, `subtitle`, `address`, `capacity`, `phone_num`)
VALUES ('Moise', 'Drink Bar', 'Main Door', '30', '043-333-3333');

-- event
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-1-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-2-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-3-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-4-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-5-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-6-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-7-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-8-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-9-17', '3');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-10-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('BINS X BROKEN SUBMARINS', 'BAND CONCERT', '2022-11-17', '1');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('OPEN LEAGUE DAY', 'EK Championship Final', '2022-11-25', '2');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('MATH WITH ART', 'CONFERENCE', '2022-12-21', '3');
INSERT INTO `events_calendar`.`event` (`name`, `subtitle`, `date`, `location_id`)
VALUES ('SEMESTER\'s END PARTY', 'PARTY', '2022-12-27', '1');

-- host
INSERT INTO `events_calendar`.`host` (`club_id`, `event_id`) VALUES ('1', '1');
INSERT INTO `events_calendar`.`host` (`club_id`, `event_id`) VALUES ('2', '2');
INSERT INTO `events_calendar`.`host` (`club_id`, `event_id`) VALUES ('3', '3');
INSERT INTO `events_calendar`.`host` (`club_id`, `event_id`) VALUES ('4', '3');
INSERT INTO `events_calendar`.`host` (`club_id`, `event_id`) VALUES ('3', '4');

-- participants
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '1');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '1');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '1');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '2');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '2');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '2');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '3');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '4');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '5');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '6');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '7');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '8');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '9');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '10');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '11');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '12');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '13');
INSERT INTO `events_calendar`.`participants` (`user_id`, `event_id`) VALUES ('1', '14');

-- review
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('1', '2', 'very good concert', '5');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('1', '3', 'good concert', '4');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('2', '1', 'very good', '4');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('2', '6', 'fun!', '5');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('2', '7', 'interesting show!', '3');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('3', '4', 'not good...', '2');
INSERT INTO `events_calendar`.`review` (`event_id`, `author`, `review`, `score`)
VALUES ('4', '3', 'very good party', '5');

-- club_community
INSERT INTO `events_calendar`.`club_community` (`name`, `opening_date`, `member`)
VALUES ('BINMMUNITY', '2022-03-02', '35');
INSERT INTO `events_calendar`.`club_community` (`name`, `opening_date`, `member`)
VALUES ('FIFAADDICT', '2022-03-02', '50');
INSERT INTO `events_calendar`.`club_community` (`name`, `opening_date`, `member`)
VALUES ('MATHICA', '2022-03-02', '60');
INSERT INTO `events_calendar`.`club_community` (`name`, `opening_date`, `member`)
VALUES ('JONG ROAD', '2022-03-02', '20');

-- user n community
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('1', '1');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('1', '2');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('1', '3');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('2', '4');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('2', '5');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('2', '6');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('3', '7');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('3', '1');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('3', '2');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('4', '3');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('4', '4');
INSERT INTO `events_calendar`.`user_and_community` (`community_id`, `user_id`) VALUES ('4', '5');

-- post
INSERT INTO `events_calendar`.`post` (`author`, `community_id`, `title`, `content`, `view`, `upvote`, `downvote`)
VALUES ('1', '1', 'join our club!', 'It is fun! let\'s join!', '4', '2', '1');
INSERT INTO `events_calendar`.`post` (`author`, `community_id`, `title`, `content`, `view`, `upvote`, `downvote`)
VALUES ('3', '2', 'join our club!', 'It is fun! let\'s join!', '4', '2', '1');
INSERT INTO `events_calendar`.`post` (`author`, `community_id`, `title`, `content`, `view`, `upvote`, `downvote`)
VALUES ('6', '3', 'join our club!', 'It is fun! let\'s join!', '4', '2', '1');
