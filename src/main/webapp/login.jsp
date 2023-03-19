
<!DOCTYPE html>
<html>
<head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Rubik:wght@300&display=swap" rel="stylesheet">
        <style>
            h6 {
              font-family: 'Amatic SC';
              font-size: 3em;
              text-align: center;
            }
        </style>
</head>
    <body>        
        <!--Content-->
        <%! String err; %>
        <% err = (String) request.getAttribute("error");
        if (err != null) {
            out.print("<h6 class='mt-5'>" + err + "</h6>");
        }%>
        <section>
          <div class="form-box">
              <div class="form-value">
                  <form action="./login" name="" method="POST">
                      <h6 class="mt-5">Login</h6>
                      <div class="inputbox">
                          <input name="username" type="text" required>
                          <label for="">Username</label>
                      </div>
                      <div class="inputbox">
                          <input name="password" type="password" required>
                          <label for="">Password</label>
                      </div>
                      <div class="d-flex justify-content-center mt-5 mb-5">
                          <input type="submit" class="btn btn-outline-light">
                      </div>
                  </form>
              </div>
          </div>
      </section>          
          <script src="js/test.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous">
          </script>
    </body>
</html>