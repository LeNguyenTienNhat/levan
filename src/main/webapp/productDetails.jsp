
<%@page import="com.levan.Product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product . Create</title>
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <style>
            input.form-control, textarea.form-control, select{
                color: white !important;
                background-color: rgba(0, 0, 0, 0) !important;
            }
            option {
                color: black;
            }
            body {
                font-family: 'Rubik';
            }
            h2 { 
              font-size: 3em;
            }
            td {
                margin: 5rem;
                width: 30rem;
                padding-left: 5rem;
            }
            input {
            width: 10rem;
            height: 3rem;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
          }
          img {
              width: 30vw; 
              height: 30vw;  
              object-fit: cover; 
              object-position: 25% 75%
          }
        </style>
    </head>
    <body>              
        <header class="navbar sticky-top flex-md-nowrap p-0 mt-3">
        <a class="col-md-3 col-lg-2 me-0 px-3" id="logo" href="dashboard" style="font-family: monospace">LEVAN</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav">
          <div class="nav-item text-nowrap">
          </div>
        </div>
      </header>
        
         
         <%! ProductDTO product; %>
            <% product = (ProductDTO) request.getAttribute("object"); 
            %>
        <a href="dashboard" class="btn btn-outline-danger col-3 m-2" style="width: 7rem"><- Back</a>
         <div class="row wrapped" style="margin-top: 2rem;">
          <!--Left content-->
          <div class="col-6">
            <div class="d-flex justify-content-center">
                <% out.print("<img src='"+product.getImgPath() +" '>"); %>
            </div>
          </div>

          <!--Right content-->
          <div class="col-4 mt-3" style="padding: 0 5rem 0 5rem; ">
              <% out.print("<h2>"+product.getName() +"</h2>"
                      + "<p class='mt-3'>"+product.getDescription()+"</p>"
                      + "<p class='mt-3'> Time added:     "+product.getAddDate()+"</p>"
                      + "<p class='mt-1'> Category:     "+product.getCategory_ID()+"</p>"
                      + "<p class='mt-1'> Available in storage:     "+product.getQuantity()+"</p>"
                      + "<h3 class='mt-3'>"+product.getPrice()+"  VND"+"</h3>"
              ); 
              %>
            
            <form>
                <% out.print("<input type=hidden name='ID' value='"+product.getID()+"'>"); %>
                <input type=hidden name="action" value="productedit">
                <input type=submit class="btn btn-outline-light mt-3" value="Edit">
            </form>
          </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous">
        </script>
    </body>
</html>
