var express  = require('express'),
    path     = require('path'),
    bodyParser = require('body-parser'),
    app = express(),
    expressValidator = require('express-validator');


/*Set EJS template Engine*/
app.set('views','./views');
app.set('view engine','ejs');

app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true })); //support x-www-form-urlencoded
app.use(bodyParser.json());
app.use(expressValidator());

/*MySql connection*/
var connection  = require('express-myconnection'),
    mysql = require('mysql');

app.use(
    connection(mysql,{
        connectionLimit : 10,
        host            : 'localhost',
        user            : 'root',
        password        : '12345',
        database        : 'classroomprofessionals',
        multipleStatements: true,
        debug           : false //set true if you wanna see debug logger
    },'request')
);

// app.get('/blog', function (req, res) {
//     res.render('blog');
// });

app.get('/blog-post', function (req, res) {
    res.render('blog-post');
});

app.get('/gui-kit', function (req, res) {
    res.render('gui-kit');
});

app.get('/header', function (req, res) {
    res.render('header');
});

app.get('/listing-filter', function (req, res) {
    res.render('listing-filter');
});

app.get('/profile_company', function (req, res) {
    res.render('profile_company');
});

app.get('/profile_user', function (req, res) {
    res.render('profile_user');
});

//RESTful route
var router = express.Router();

/*------------------------------------------------------
*  This is router middleware,invoked every time we hit url
*  we can use this for doing validation,authentication
--------------------------------------------------------*/
router.use(function(req, res, next) {
    console.log(req.method, req.url);
    next();
});

var data;
// -----------------------------------------------------------------------------
var login = router.route('/login');

login.get(function(req,res,next){
  res.render('index');
});

login.post(function(req,res,next){

    console.log("req.body--", req.body);

    //get data
    // var data;
    if (req.body.fullName==undefined) { //  login
        data = {
            emailid:req.body.email,
            password:req.body.password
         };
    }
    else {                        //  register
      data = {
          name:req.body.fullName,
          emailid:req.body.email,
          password:req.body.password,
          phone:req.body.phone
       };
    }

    // inserting into mysql
    req.getConnection(function (err, conn){
        if (err)
          return next("Cannot Connect");

        if (req.body.fullName==undefined){   //login
          var query = conn.query("SELECT name FROM classroomprofessionals.Professionals WHERE emailid = '"+data.emailid+"' and password = '"+data.password+"' ", function(err,rows){
              if(err){
                console.log(err);
                  return next("Mysql error, check your query");
              }
              if(rows.length==0)
                res.status(400).json("Invalid emailID - password");
              else
              res.status(200).json(rows[0].name);
           });
        }
        else{         //register
          var query = conn.query("INSERT INTO classroomprofessionals.professionals set ? ", data, function(err, rows){
             if(err){
                  console.log(err);
                  return next("Mysql error, check your query");
             }
             res.sendStatus(200);
          });
        }
     });
});



var dashboard = router.route('/dashboard');

dashboard.get(function(req,res,next){
    var connections, connectionCount, connectiondetails, follows, followCount, followdetails, details;
    console.log("req.body--", req.body);

    req.getConnection(function(err, conn){

        if(err)
            return next("Cannot Connect");
        else{
            conn.query("SELECT * FROM classroomprofessionals.Professionals WHERE emailid = ? ", data.emailid, function(err, rows) {
                if(err){
                    console.log(err);
                    return next("Mysql error, check your query")
                }
                else{
                    details = JSON.parse(JSON.stringify(rows[0]));
                    console.log(details);
                }
            });

            conn.query("SELECT * FROM classroomprofessionals.professionals WHERE pid in (SELECT p2_id FROM classroomprofessionals.connections FULL JOIN classroomprofessionals.Professionals ON p1_id = pid WHERE emailid = ?)", data.emailid, function(err1, rows1) {
                console.log(rows1);
                if(err){
                    console.log(err1);
                    return next("Mysql error, check your query");
                }
                else{
                    connectiondetails = JSON.parse(JSON.stringify(rows1));
                    console.log(connectiondetails);
                    connectionCount = Object.keys(connectiondetails).length;
                    console.log(details);

                }
            });

            conn.query("Select * FROM classroomprofessionals.company WHERE company_id in (SELECT company_id FROM classroomprofessionals.follow NATURAL JOIN classroomprofessionals.Professionals  WHERE emailid = ?)", data.emailid, function(err1, rows1) {
                if(err1){
                    console.log(err1);
                    return next("Mysql error, check your query");
                }
                else{
                    followdetails = JSON.parse(JSON.stringify(rows1));
                    console.log(followdetails);
                    followCount = Object.keys(followdetails).length;
                    res.render('dashboard', {
                        details: details,
                        connectionCount: connectionCount,
                        connectiondetails:connectiondetails,
                        followCount:followCount,
                        followdetails:followdetails
                    });

                }
            });
        }
    })
});

var blog = router.route('/blog');

blog.get(function(req, res, next){
    var blogdetails, blogcount;

    req.getConnection(function(err, conn) {
        if(err){
            return next("cannot connect");
        }
        else{
            // query here
            conn.query("SELECT * FROM classroomprofessionals.articles WHERE a_id in (SELECT a_id FROM classroomprofessionals.post ORDER BY post_time DESC )", function(err, rows) {
                if(err){
                    return next("Mysql error. Check your query.");
                }
                else {
                    blogdetails = JSON.parse(JSON.stringify(rows));
                    blogcount = Object.keys(blogdetails).length;
                    console.log(blogdetails);
                    console.log(blogcount);
                    res.render('blog',{
                        blogdetails: blogdetails,
                        blogcount: blogcount
                    });
                }
            })
        }
    })
});


var userprofile = router.route('/profile_user/:user_id');

userprofile.get(function(req, res, next) {
    var user_id = req.params.user_id;
    console.log(user_id);
    var userdetails, userskills, skillcount, similarprofessionals, professionalcount, jobs, jobcount;
    req.getConnection(function(err, conn) {
        if(err){
            return next("Cannot Connect");
        }
        else{
            conn.query("SELECT * FROM classroomprofessionals.professionals WHERE emailid = ?", user_id, function(err, rows) {
                if(err){
                    console.log(err);
                    return next("Mysql error, check your 1");

                }
                else{
                    userdetails = JSON.parse(JSON.stringify(rows));
                    console.log(userdetails);

                }

            });

            conn.query("SELECT * FROM classroomprofessionals.skills WHERE pid in (SELECT pid from classroomprofessionals.professionals WHERE emailid = ?)", user_id, function(err, rows) {
                if(err){
                    console.log(err);
                    return next("Mysql error, check your query 2");
                }
                else{
                    userskills = JSON.parse(JSON.stringify(rows));
                    skillcount = Object.keys(userskills).length;
                    console.log(userskills);

                }
            });

            conn.query("SELECT * FROM classroomprofessionals.professionals WHERE headline in (SELECT headline from classroomprofessionals.professionals WHERE emailid = ?) and emailid <> ?", [user_id, user_id], function(err, rows) {
                if(err){
                    console.log(err);
                    return next("Mysql error, check your query 3");
                }
                else{
                    similarprofessionals = JSON.parse(JSON.stringify(rows));
                    professionalcount = Object.keys(similarprofessionals).length;
                    console.log(similarprofessionals);
                }
            });

            conn.query("SELECT * FROM classroomprofessionals.jobs NATURAL JOIN classroomprofessionals.company", function(err, rows) {
                if(err){
                    console.log(err);
                    return next("Mysql error, check your query 4");
                }
                else{
                    jobs = JSON.parse(JSON.stringify(rows));
                    jobcount = Object.keys(jobs).length;
                    console.log(jobs);
                    res.render('profile_user',{
                        users:userdetails,
                        userskills:userskills,
                        skillcount:skillcount,
                        similarprofessionals:similarprofessionals,
                        professionalcount:professionalcount,
                        jobs:jobs,
                        jobcount:jobcount
                    })
                }
            });
        }
    })

});


var companyprofile = router.route('/profile_company');

companyprofile.get(function(req, res, next) {
    var company, followers, followercount;
    req.getConnection(function(err, conn) {
        //add err if else
        conn.query("SELECT * FROM classroomprofessionals.company WHERE emailid = ?", data.emailid, function (err, rows) {
            if(err){
                console.log(err);
                return next("Mysql error, check your query");
            }
            else{
                company = JSON.parse(JSON.stringify(rows));
            }
        });
        conn.query("SELECT * FROM classroomprofessionals.follows WHERE company_id = (SELECT company_id FROM classroomprofessionals.company WHERE emailid = ?", data.emailid, function(err, rows) {
            if(err){
                console.log(err);
                return next("mysql error, check your query");
            }
            else {
                followers = JSON.parse(JSON.stringify(rows));
                followercount = Object.keys(followers).length;
                console.log(company);
                res.render('profile_company',{
                    company:company,
                    followercount:followercount
                })
            }

        });
    })
});

var blogpost = router.route('/api/blog-post/:blogid');

// blogpost.all(function(req, res, next) {
//     console.log("You need to smth about blogdetails Route ? Do it here");
//     console.log(req.params);
//     next();
// });

blogpost.get(function(req, res, next){
    var blogdetails;
    var blogid = req.params.blogid;
    console.log(blogid);
    req.getConnection(function(err, conn){
        if(err){
            return next("Cannot Connect");
        }
        else {
            conn.query("SELECT * FROM classroomprofessionals.articles WHERE a_id = ?", [blogid], function(err, rows) {
                if(err){
                    console.log(err);
                    return next("mysql error, check your query");
                }
                else{
                    blogdetails = JSON.parse(JSON.stringify(rows));
                    console.log(blogdetails);
                    res.render('blog-post',{
                        blog: blogdetails
                    })
                }
            })
        }
    })
});


// -----------------------------------------------------------------------------

//now we need to apply our router here
app.use(router);

//start Server
var server = app.listen(3000,function(){

   console.log("Listening to port %s",server.address().port);

});
