-- 创建文章表
CREATE TABLE IF NOT EXISTS articles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    author_id BIGINT NOT NULL COMMENT '作者ID',
    title VARCHAR(255) NOT NULL COMMENT '文章标题',
    slug VARCHAR(255) UNIQUE NOT NULL COMMENT '文章别名，用于URL',
    content TEXT COMMENT '文章内容，采用Markdown格式',
    excerpt VARCHAR(500) COMMENT '文章摘要',
    cover_image VARCHAR(500) COMMENT '封面图链接',
    view_count INT DEFAULT 0 COMMENT '浏览量',
    like_count INT DEFAULT 0 COMMENT '点赞数',
    collect_count INT DEFAULT 0 COMMENT '收藏数',
    comment_count INT DEFAULT 0 COMMENT '评论数',
    status ENUM('draft', 'published', 'archived') DEFAULT 'draft' COMMENT '文章状态',
    is_featured BOOLEAN DEFAULT FALSE COMMENT '是否推荐',
    is_top BOOLEAN DEFAULT FALSE COMMENT '是否置顶',
    published_at DATETIME COMMENT '发布时间',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_author_id (author_id),
    INDEX idx_slug (slug),
    INDEX idx_status (status),
    INDEX idx_published_at (published_at),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章表';

-- 创建文章分类表
CREATE TABLE IF NOT EXISTS article_categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT '分类名称',
    slug VARCHAR(100) UNIQUE NOT NULL COMMENT '分类别名',
    description VARCHAR(500) COMMENT '分类描述',
    parent_id BIGINT DEFAULT NULL COMMENT '父级分类ID，用于构建层级结构',
    sort_order INT DEFAULT 0 COMMENT '排序权重',
    article_count INT DEFAULT 0 COMMENT '该分类下文章数量',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_parent_id (parent_id),
    INDEX idx_slug (slug),
    FOREIGN KEY (parent_id) REFERENCES article_categories(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分类表';

-- 创建文章标签表
CREATE TABLE IF NOT EXISTS article_tags (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL COMMENT '标签名称',
    slug VARCHAR(50) UNIQUE NOT NULL COMMENT '标签别名',
    color VARCHAR(7) DEFAULT '#666666' COMMENT '标签颜色',
    article_count INT DEFAULT 0 COMMENT '该标签下文章数量',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签表';

-- 创建文章-分类关联表
CREATE TABLE IF NOT EXISTS article_category_relations (
    article_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
    PRIMARY KEY (article_id, category_id),
    INDEX idx_article_id (article_id),
    INDEX idx_category_id (category_id),
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES article_categories(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分类关联表';

-- 创建文章-标签关联表
CREATE TABLE IF NOT EXISTS article_tag_relations (
    article_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '关联创建时间',
    PRIMARY KEY (article_id, tag_id),
    INDEX idx_article_id (article_id),
    INDEX idx_tag_id (tag_id),
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES article_tags(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签关联表';

-- 插入示例数据
-- 插入分类数据
INSERT INTO article_categories (name, slug, description, sort_order) VALUES
('前端技术', 'frontend', '前端开发相关技术文章', 1),
('后端技术', 'backend', '后端开发相关技术文章', 2),
('数据库', 'database', '数据库相关技术文章', 3),
('算法', 'algorithm', '算法相关文章', 4);

-- 插入标签数据
INSERT INTO article_tags (name, slug, color) VALUES
('Vue', 'vue', '#4FC08D'),
('React', 'react', '#61DAFB'),
('Spring Boot', 'spring-boot', '#6DB33F'),
('MySQL', 'mysql', '#4479A1'),
('JavaScript', 'javascript', '#F7DF1E'),
('CSS', 'css', '#1572B6');

-- 插入示例文章
INSERT INTO articles (author_id, title, slug, content, excerpt, cover_image, status, is_featured, published_at) VALUES
(1, 'Vue3入门教程', 'vue3-introduction', '# Vue3入门教程\n\nVue3是Vue.js的最新版本，带来了许多新特性...\n\n## 响应式系统\n\nVue3采用了Proxy替代Object.defineProperty...\n\n## Composition API\n\nComposition API让我们能更好地组织代码...', 'Vue3是Vue.js的最新版本，带来了许多新特性，如Composition API、更好的TypeScript支持等', 'https://example.com/vue-cover.jpg', 'published', TRUE, NOW()),
(1, 'Spring Boot实战', 'spring-boot-practice', '# Spring Boot实战\n\nSpring Boot简化了Spring应用的初始搭建以及开发过程...\n\n## 自动配置\n\nSpring Boot会根据类路径中的jar包自动配置beans...', 'Spring Boot简化了Spring应用的初始搭建以及开发过程，提供了大量的自动配置功能', 'https://example.com/spring-cover.jpg', 'published', TRUE, NOW()),
(1, 'React Hooks全解析', 'react-hooks-comprehensive', '# React Hooks全解析\n\nHooks允许我们在不编写class的情况下使用state和其他React特性...\n\n## useState\n\nuseState是一个允许你在函数组件中添加state的Hook...', 'React Hooks允许我们在不编写class的情况下使用state和其他React特性', 'https://example.com/react-cover.jpg', 'published', FALSE, NOW()),
(1, 'MySQL索引优化', 'mysql-index-optimization', '# MySQL索引优化\n\n索引是提高数据库查询性能的重要手段...\n\n## B+树索引\n\nB+树是一种平衡的多路搜索树...', 'MySQL索引是提高数据库查询性能的重要手段，了解索引原理有助于优化查询性能', 'https://example.com/mysql-cover.jpg', 'published', FALSE, NOW());