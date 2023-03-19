
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
/*            html {
                overflow-y: hidden;
            }*/
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
                padding-right: 10rem;
                padding-top: 1rem;
                padding-bottom: 1rem;
            }
            form {
                padding: 5rem 10rem 2rem 10rem;
            }
            input {
            width: 10rem;
            height: 3rem;
            padding: 12px 20px;
            box-sizing: border-box;
          }
          
        </style>
    </head>
    <body>                  
        <div class="container" style="margin-top: 2rem; width: 70vw">
         <form class="row g-3 wrapped">
             <h2>New Product</h2>
            <div class="col-6">
              <label class="form-label">Product Name</label>
              <input name="Name" type="text" class="form-control" onclick="this.value='';this.style.color='white'">
            </div><div class="col-2"></div>
             
            <div class="col-3">
              <label class="form-label">Category</label>
              <select name="category_ID" class="form-select">
                            <option selected>plant</option>
                            <option>flower</option>
                            <option>seed</option>
              </select>
            </div><div class="col-12"></div>
             
            <div class="col-2">
              <label class="form-label">Quantity</label>
              <input id="Quantity" name="Quantity" type="text" class="form-control"  onclick="this.value='';this.style.color='white'">
            </div>
             
            <div class="col-2">
              <label class="form-label">Price</label>
              <input id="Price" name="Price" type="text" class="form-control" onclick="this.value='';this.style.color='white'">
            </div><div class="col-12"></div>
             
            <div class="col-6">
              <label class="form-label">Image path</label>
              <input name="ImgPath" class="form-control" type="text">
            </div>
             
            <div class="col-11 mb-4">
              <label class="form-label">Description</label>
              <textarea id="Description" name="Description"  class="form-control" style="height: 100px" 
                               onclick="this.value='';this.style.color='white'"></textarea>
            </div>
            
                 <input name="action" value="${requestScope.action}" type="hidden">
                 <input class="btn btn-outline-light col-3 m-2 " value="Save" type="Submit">
                 <a href="dashboard" class="btn btn-outline-danger col-3 m-2">Cancel</a>
           </form>
        </div>
              
            
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous">
          </script>
    </body>
</html>
