package jsu.bean;

public class Admin {
    private Integer adminId;
    private String adminName;
    private String adminPWD;

    public Admin() {
    }

    public Admin(Integer adminId, String adminName, String adminPWD) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPWD = adminPWD;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPWD() {
        return adminPWD;
    }

    public void setAdminPWD(String adminPWD) {
        this.adminPWD = adminPWD;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPWD='" + adminPWD + '\'' +
                '}';
    }
}
