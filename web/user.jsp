<!DOCTYPE html>
<html>
  <head>
    <title>Bus Management</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="animate.css">
    <link href="homestyle.css" rel="stylesheet">


    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>


  <body>
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Bus Management site</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="home.jsp">Home</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
           <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome  Admin</a></li>
           <li><a href="index.html"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
          </ul>
        </div>
      </div>
      </nav>

      <script>
    $(document).ready(function () {
        console.log("-> " + window.location.pathname);
        if (window.location.pathname == "/eprofile" || window.location.pathname == "/uprofile" || window.location.pathname == "/upload") {
            $("[href='/home']").addClass('active');
        }
        if (window.location.pathname == "/edit_user") {
            $("[href='/ulist']").addClass('active');
        }
    });
</script>

      <script>
          $(document).ready(function () {
              $(".sidebar a").each(function () {
                  console.log($(this).attr('href'));
                  if ((window.location.pathname.indexOf($(this).attr('href'))) > -1) {
                      $(this).addClass('active');
                  }
              });
          });
      </script>


      <div class="container-fluid text-center">
        <div class="row content">

            <div class="col-sm-2 sidebar text-center text-capitalize" style="padding-right: 0px;padding-left: 0px;">
             <a href="user.jsp">Add User</a>
              <a href="bus.jsp">Bus Schedules</a>
              <a href="driver.jsp">Driver table</a>
              <a href="route.jsp">Manage routes</a>
          </div>



      <div class="col-sm-10 container content" style="margin-top:50px;">
            <h1 style="margin-bottom:40px">Add a User</h1>

            <div class="col-sm-3">
            </div>

            <div class="col-sm-6">

          <form action="/add_user" method="post" class="form-horizontal">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input type="email" required="" name="username" class="form-control" id="username"
                                            placeholder="Email" onblur="myFunction()"><br>
                                    </div>
                                    <div class="form-group">
                                        <input type="tel" required="" name="phone" pattern="[0-9]{10}" class="form-control"
                                            maxlength="10" id="phone" placeholder="Phone Number"><br>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required="" name="city" class="form-control" placeholder="City"><br>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" required="" name="password" class="form-control"
                                            placeholder="Password"><br>
                                    </div>
                                    <div class="form-group">
                                        <label>Role:</label><br>
                                        <select data-style="btn-info" name="roleoptions" class="form-control sel">
                                            <optgroup label="Select User Role">
                                                <option value="user" selected="selected">User</option>
                                                <option value="staff">Staff</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                    <div class="form-group" align="center">
                                        <input type="submit" value="Add User" class="btn btn-success">
                                        <a value="Cancel" class="btn btn-danger" href="/home">Cancel</a>
                                    </div>
                                </div>
                            </form>
                    </div>
              <br><br><br>
           </div>  <!--  10 container -->


        </div>
      </div>





    </body>
    </html>
