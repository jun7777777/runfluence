<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>    
<html lang="ko" >
<meta charset="UTF-8">
<title>RunFluence_STYLE</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Optional Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- <script src="/static/js/main.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
    line-height: 1.5;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Header Section */
.header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
}

.profile-info {
    display: flex;
    align-items: center;
}

.profile-pic {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    margin-right: 10px;
}

.profile-pic img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-details {
    font-size: 14px;
}

.actions {
    display: flex;
    gap: 10px;
}

.action-btn {
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: #000;
    color: #fff;
    font-size: 14px;
}

/* Image Section */
.image-section {
    text-align: center;
    margin-bottom: 20px;
}

.image-section img {
    max-width: 100%;
    border-radius: 10px;
}

/* Post Details */
.post-details {
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
    font-size: 14px;
}

/* Like and Interaction Section */
.interaction {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 10px;
}

.like {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    cursor: pointer;
}

.related-posts {
    margin-top: 20px;
}

.related-posts h3 {
    font-size: 16px;
    margin-bottom: 10px;
}

.related-posts-grid {
    display: flex;
    gap: 10px;
}

.related-post {
    width: 100px;
    height: 100px;
    border-radius: 10px;
    overflow: hidden;
}

.related-post img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Footer Section */
.footer {
    background-color: #000;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    font-size: 12px;
    margin-top: 40px;
}

.footer a {
    color: #fff;
    text-decoration: none;
    margin: 0 10px;
}
</style>

<body>
<div class="container">
    <div class="header">
        <div class="profile-info">
            <div class="profile-pic">
                <img src="profile.jpg" alt="Profile">
            </div>
            <div class="profile-details">
                <p>User Name</p>
                <p>2024-12-21</p>
            </div>
        </div>
        <div class="actions">
            <button class="action-btn">Back</button>
            <button class="action-btn">Edit</button>
            <button class="action-btn">Delete</button>
        </div>
    </div>
    <div class="image-section">
        <img src="cat-image.jpg" alt="Post Image">
    </div>
    <div class="post-details">
        
    </div>
    <div class="interaction">
        <div class="like">
            <span>❤️</span>
            <span>2</span>
        </div>
    </div>
    <div class="related-posts">
        <h3>Related Posts</h3>
        <div class="related-posts-grid">
            <div class="related-post">
                <img src="related1.jpg" alt="Related Post 1">
            </div>
            <div class="related-post">
                <img src="related2.jpg" alt="Related Post 2">
            </div>
            <div class="related-post">
                <img src="related3.jpg" alt="Related Post 3">
            </div>
        </div>
    </div>
    
</div>
 <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>
