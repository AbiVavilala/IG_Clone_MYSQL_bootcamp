-- IG challengens from MYSQL bootcamo

-- select most loyal customers 

select * from users
order by created_at
LIMIT 5;

-- what days most users are registerng

select dayname(created_at) AS dayofweek,
count(*) as Total
from users
group by dayofweek;

-- find the users who have never postedALTER

select username,
photos.id
from 
users
left join photos
on users.id = photos.user_id
where photos.id is NULL;
 

-- identify most popular photo and who created it

 select
 username,
 photos.id,
 count(*) AS total
from photos
inner join likes
on likes.photo_id = photos.id
inner join users
on users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;



 -- how many times foes average user posted
 
 select (select count(*) from photos) / (select count(*) from users) as Average;
 
 
 -- top 5 most used hashtags
 
select 
tag_name,
photo_id,
count(*) AS most_used_tags
from photo_tags
join tags 
on photo_tags.tag_id = tags.id 
group by tag_id
order by most_used_tags DESC;


SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 


-- Finding the bots - the users who have liked every single photo

select username,
count(*) As total
from users
join likes
on users.id = likes.user_id
group by likes.user_id
having total = (select count(*) from photos)

 SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 
 
 
 
 
 
