package jsu.bean;

public class Food {
    private Integer foodId;
    private String foodImg;
    private String foodName;
    private Double foodPrice;
    private Integer foodNum;
    private Integer foodHot;
    private Integer foodSales;
    private String userName;

    public Food() {
    }

    public Food(Integer foodId, String foodImg, String foodName, Double foodPrice, Integer foodNum, Integer foodHot, Integer foodSales, String userName) {
        this.foodId = foodId;
        this.foodImg = foodImg;
        this.foodName = foodName;
        this.foodPrice = foodPrice;
        this.foodNum = foodNum;
        this.foodHot = foodHot;
        this.foodSales = foodSales;
        this.userName = userName;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Integer getFoodNum() {
        return foodNum;
    }

    public void setFoodNum(Integer foodNum) {
        this.foodNum = foodNum;
    }

    public Integer getFoodHot() {
        return foodHot;
    }

    public void setFoodHot(Integer foodHot) {
        this.foodHot = foodHot;
    }

    public Integer getFoodSales() {
        return foodSales;
    }

    public void setFoodSales(Integer foodSales) {
        this.foodSales = foodSales;
    }

    public void setFoodPrice(Double foodPrice) {
        this.foodPrice = foodPrice;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFoodImg() {
        return foodImg;
    }

    public void setFoodImg(String foodImg) {
        this.foodImg = foodImg;
    }

    public Double getFoodPrice() {
        return foodPrice;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodId=" + foodId +
                ", foodImg='" + foodImg + '\'' +
                ", foodName='" + foodName + '\'' +
                ", foodPrice=" + foodPrice +
                ", foodNum=" + foodNum +
                ", foodHot=" + foodHot +
                ", foodSales=" + foodSales +
                ", userName='" + userName + '\'' +
                '}';
    }
}
