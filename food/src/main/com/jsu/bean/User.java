package jsu.bean;

public class User {
    private Integer userId;
    private String userName;
    private String userEmail;
    private String userPWD;

    public User() {
    }

    public User(Integer userId, String userName, String userEmail, String userPWD) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPWD = userPWD;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPWD() {
        return userPWD;
    }

    public void setUserPWD(String userPWD) {
        this.userPWD = userPWD;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPWD='" + userPWD + '\'' +
                '}';
    }
}
