
package com.levan.Product;

public class ProductDTO {
    public int ID;
    public String Name;
    public String category_ID;
    public int Quantity;
    public String ImgPath;
    public int Price;
    public String AddDate;
    public String Description;

    public ProductDTO(){
    }

    public ProductDTO(int ID, String Name, String category_ID, int Quantity, String ImgPath, int Price, String AddDate, String Description) {
        this.ID = ID;
        this.Name = Name;
        this.category_ID = category_ID;
        this.Quantity = Quantity;
        this.ImgPath = ImgPath;
        this.Price = Price;
        this.AddDate = AddDate;
        this.Description = Description;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(String category_ID) {
        this.category_ID = category_ID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getImgPath() {
        return ImgPath;
    }

    public void setImgPath(String ImgPath) {
        this.ImgPath = ImgPath;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getAddDate() {
        return AddDate;
    }

    public void setAddDate(String AddDate) {
        this.AddDate = AddDate;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
}
