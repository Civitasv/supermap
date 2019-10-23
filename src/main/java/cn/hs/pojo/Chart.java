package cn.hs.pojo;

public class Chart {
	private String province;
	private int coldNum;
	private int warmNum;
	private int summary;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getColdNum() {
        return coldNum;
    }

    public void setColdNum(int coldNum) {
        this.coldNum = coldNum;
    }

    public int getWarmNum() {
        return warmNum;
    }

    public void setWarmNum(int warmNum) {
        this.warmNum = warmNum;
    }

    public int getSummary() {
        return summary;
    }

    public void setSummary(int summary) {
        this.summary = summary;
    }

    // Empty Constructor
    public Chart() {
    }
}
