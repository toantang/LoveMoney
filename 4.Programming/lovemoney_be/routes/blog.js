const express = require('express');
const router = new express.Router();
const Blog = require('../models/blog');

router.post('/blogs', (req, res) => {
    
    const blog = new Blog(req.body);
    blog.save().then((blog) => {
        res.status(201).send(blog);
    }).catch((error) => {
        res.status(400).send(error);
    })
    
})

module.exports = router;