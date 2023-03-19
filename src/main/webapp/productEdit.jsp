
<%@page import="com.levan.Product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product . Edit</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product . Create</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/dashboard.css">
        <style>
            html {
                overflow-y: hidden;
            }
            input.form-control, textarea.form-control, select{
                color: white !important;
                background-color: rgba(0, 0, 0, 0) !important;
            }
            .inputbox {
                margin-top: 3rem;
            }
            option {
                color: black;
            }
            body {
                font-family: "Rubik";
                background: rgba(61,67,75,255);  
            }
            h2 { 
              font-size: 3em;
            }
            input {
            width: 10rem;
            height: 3rem;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
          }
          label {
              margin-top: 1rem;
          }
        </style>
        
    </head>
    <body>
        <header class="navbar sticky-top flex-md-nowrap p-0 mt-3 shadow">
        <a class="col-md-3 col-lg-2 me-0 px-3" id="logo" href="dashboard" style="font-family: monospace">LEVAN</a>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-nav">
          <div class="nav-item text-nowrap">
          </div>
        </div>
      </header>
           
        
        <div class="container" style="margin-bottom: 10rem; margin-top: 1rem; width: 70vw">
            <a href="dashboard" class="btn btn-outline-danger col-1 mb-4"><- Back</a>
            <h2 class="mb-4">Update information</h2>
         <%! ProductDTO product; %>
            <% product = (ProductDTO) request.getAttribute("object"); %>
             <form class="wrapped p-5 pt-2">
                 <div class="row g-3">
              <% out.print("<div class='col-4'><label>Product name</label><input name='Name' type='text' class='form-control' value='"+product.getName()+"' ></div>"
                      + "<div class='col-2'><label>Category</label><input name='category_ID' type='text' class='form-control' value='"+product.getCategory_ID()+"' ></div>"
                      + "<div class='col-2'><label>Quantity</label><input name='Quantity' type='text' class='form-control' value='"+product.getQuantity()+"' ></div>"
                      + "<div class='col-5'><label>Image path</label><input name='ImgPath' type='text' class='form-control' value='"+product.getImgPath()+"' ></div>"
                      + "<div class='col-2'><label>Price</label><input name='Price' type='text' class='form-control' value='"+product.getPrice()+"' ></div>"
                      + "<div class='col-11'><label>Description</label><input name='Description' type='text' class='form-control' value='"+product.getDescription()+"' ></div>"); 
              %>
              <% out.print("<input type=hidden name='ID' value='"+product.getID()+"'>"); %>
                <input type=hidden name="action" value="productupdate">
                <input type=submit class="btn btn-light col-2 mt-4"  value="Update">
                </div>
              </form>
        </div>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous">
          </script>
          <script>
              onclick="this.value='';this.style.color='white'";
          </script>
    </body>
</html>
