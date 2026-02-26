-- 插入测试数据
INSERT INTO moods (author_id, content, mood_type, images, like_count, comment_count, is_public) VALUES
(1, '今天是个好日子，阳光明媚，心情舒畅！', 'happy', '["/uploads/mood1.jpg"]', 5, 2, 1),
(1, '最近工作压力好大，有点烦恼，希望快点结束项目', 'worried', '[]', 3, 1, 1),
(1, '刚刚去了一趟黄山，风景真的太美了，不虚此行！', 'happy', '["/uploads/mood3_1.jpg", "/uploads/mood3_2.jpg"]', 8, 3, 1),
(1, '今天心情有点低落，不知道为什么，就是想一个人静静', 'sad', '[]', 2, 0, 1),
(1, '学习了一整天，虽然累但很充实，继续加油！', 'calm', '["/uploads/mood5_1.jpg"]', 4, 1, 1);

-- 检查数据是否插入成功
SELECT * FROM moods WHERE is_public = 1;
SELECT * FROM moods WHERE is_public = 1;

-- 查看 moods 表中的 mood_type 值
SELECT id, content, mood_type, like_count, comment_count 
FROM moods 
WHERE is_public = 1 
ORDER BY created_at DESC;

-- 更新已有数据的心情类型
UPDATE moods 
SET mood_type = 'worried' 
WHERE id = 2 AND content LIKE '%压力%烦恼%';

UPDATE moods 
SET mood_type = 'sad' 
WHERE id = 4 AND content LIKE '%低落%';

UPDATE moods 
SET mood_type = 'calm' 
WHERE id = 5 AND content LIKE '%学习%充实%';

UPDATE moods 
SET mood_type = 'upset' 
WHERE id = 6 AND content LIKE '%不舒服%难受%';

-- 检查更新结果
SELECT id, content, mood_type 
FROM moods 
ORDER BY id;